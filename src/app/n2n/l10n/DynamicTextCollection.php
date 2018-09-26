<?php
/*
 * Copyright (c) 2012-2016, Hofmänner New Media.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This file is part of the N2N FRAMEWORK.
 *
 * The N2N FRAMEWORK is free software: you can redistribute it and/or modify it under the terms of
 * the GNU Lesser General Public License as published by the Free Software Foundation, either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * N2N is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details: http://www.gnu.org/licenses/
 *
 * The following people participated in this project:
 *
 * Andreas von Burg.....: Architect, Lead Developer
 * Bert Hofmänner.......: Idea, Frontend UI, Community Leader, Marketing
 * Thomas Günther.......: Developer, Hangar
 */
namespace n2n\l10n;

use n2n\reflection\ArgUtils;
use n2n\core\module\Module;
use n2n\util\StringUtils;

class DynamicTextCollection {
	const LANG_NS_EXT = 'lang';
	
	const REPLACEMENT_PREFIX = '[';
	const REPLACEMENT_SUFFIX = ']';
	
	private $n2nLocaleIds = array();
	private $langNamespaces = array();
	/**
	 * @param Module|Module[]|string|string[] $modules
	 * @param N2nLocale|N2nLocale[]|string|string[] $n2nLocales
	 * @param bool $fallbackToDefaultN2nLocale
	 */
	public function __construct($modules, $n2nLocales, bool $includeFallbackN2nLocale = true) {
		$this->assignN2nLocales(ArgUtils::toArray($n2nLocales));
		
		if ($includeFallbackN2nLocale) {
			$this->assignN2nLocale(N2nLocale::getFallback());
		}
		
		foreach (ArgUtils::toArray($modules) as $module) {
			$this->assignModule($module);
		}
	}
	
	/**
	 * @return string[]
	 */
	public function getN2nLocaleIds() {
		return $this->n2nLocaleIds;
	}
	
	/**
	 * @return string[]
	 */
	public function getLangNamespaces() {
		return $this->langNamespaces;
	}
	
	/**
	 * @param N2nLocale[]|string[] $n2nLocales
	 */
	public function assignN2nLocales(array $n2nLocales, bool $prepend = false) {
		$newN2nLocaleIds = $this->buildN2nLocaleIdArr($n2nLocales);
		
		if ($prepend) {
			$this->n2nLocaleIds = $newN2nLocaleIds + $this->n2nLocaleIds;
		} else {
			$this->n2nLocaleIds += $newN2nLocaleIds;
		}
	}
	
	/**
	 * @param N2nLocale|string $n2nLocale
	 * @param bool $prepend
	 */
	public function assignN2nLocale($n2nLocale, bool $prepend = false) {
		$this->assignN2nLocales(array($n2nLocale), $prepend);
	}
	
	private function buildN2nLocaleIdArr(array $n2nLocales) {
		$n2nLocaleIds = array();
		
		foreach ($n2nLocales as $n2nLocale) {
			if (!($n2nLocale instanceof N2nLocale)) {
				$n2nLocale = new N2nLocale($n2nLocale);
			}
			
			$n2nLocaleId = $n2nLocale->getId();
			$n2nLocaleIds[$n2nLocaleId] = $n2nLocaleId;
			
			$languageId = $n2nLocale->getLanguageId();
			$n2nLocaleIds[$languageId] = $languageId;
		}
		
		return $n2nLocaleIds;
	}
	
	private function buildModuleLangNs($module) {
		return trim((string) $module, '\\') . '\\' . self::LANG_NS_EXT;	
	}
	/**
	 * @param Module|string $module
	 * @param bool
	 */
	public function assignModule($module, bool $prepend = false) {
		$this->addLangNamespace($this->buildModuleLangNs($module), $prepend);
	}
	
	/**
	 * @param string $langNamespace
	 * @param bool $prepend
	 */
	public function addLangNamespace(string $langNamespace, bool $prepend = false) {
		if (!$prepend) {
			$this->langNamespaces[$langNamespace] = $langNamespace;
		} else {
			$this->langNamespaces = array($langNamespace => $langNamespace) + $this->langNamespaces;
		}
	}
	
	/**
	 * @param string|Module $module
	 * @return bool
	 */
	public function containsModule($module) {
		return isset($this->langNamespaces[$this->buildModuleLangNs($module)]);
	}

	/**
	 * @return boolean
	 */
	public function isEmpty() {
		foreach ($this->n2nLocaleIds as $n2nLocaleId) {
			foreach ($this->langNamespaces as $langNamespace) {
				$tc = TextCollectionLoader::loadIfExists($langNamespace . '\\' . $n2nLocaleId);
					
				if ($tc !== null && !$tc->isEmpty()) {
					return false;
				}
			}
		}
	
		return true;
	}
	
	/**
	 * @param string $code
	 * @param array $args
	 * @param int $num
	 * @param array $replacements
	 * @param bool $fallbackToCode
	 * @return string|null
	 */
	public function t(string $code, array $args = null, int $num = null, array $replacements = null, 
			bool $fallbackToPrettyCode = true) {
		return $this->translate($code, $args, $num, $replacements, $fallbackToPrettyCode);
	}
	
	/**
	 * @param string $code
	 * @param array $args
	 * @param int $num
	 * @param boolean $fallbackToPrettyCode
	 * @return string|null
	 */
	public function translate(string $code, array $args = null, int $num = null, array $replacements = null, 
			bool $fallbackToPrettyCode = true) {
		foreach ($this->n2nLocaleIds as $n2nLocaleId) {
			$text = $this->translateForN2nLocale($n2nLocaleId, $code, (array) $args, $num);
			if ($text !== null) {
				return $this->replace($text, $replacements);
			}
		}
		
		if ($fallbackToPrettyCode) {
			return StringUtils::pretty(TextCollection::implode($code, (array) $args));
		}
		
		return null;
	}
	
	private function replace($text, array $replacements = null) {
		if ($replacements === null) return $text;
		
		foreach ($replacements as $key => $replacement) {
			$text = str_replace(self::REPLACEMENT_PREFIX . $key . self::REPLACEMENT_SUFFIX, $replacement, $text);
		}
		return $text;
	}
	
	private function translateForN2nLocale($n2nLocaleId, $code, array $args, $num) {
		foreach ($this->langNamespaces as $langNamespace) {
			$tc = TextCollectionLoader::loadIfExists($langNamespace . '\\' . $n2nLocaleId);

			if ($tc !== null && null !== ($text = $tc->translate($code, $args, $num, false))) {
				return $text;
			}
		}
		
		return null;
	}
	
	public function containsTextCode($textCode) {
		foreach ($this->n2nLocaleIds as $n2nLocaleId) {
			foreach ($this->langNamespaces as $langNamespace) {
				$tc = TextCollectionLoader::loadIfExists($langNamespace . '\\' . $n2nLocaleId);
				if ($tc !== null && $tc->has($textCode)) return true;
			}	
		}
		
		return false;
	}
}
