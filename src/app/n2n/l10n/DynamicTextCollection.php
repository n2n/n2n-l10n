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
 * Bert Hofmänner.......: Idea, Community Leader, Marketing
 * Thomas Günther.......: Developer, Hangar
 */
namespace n2n\l10n;

use n2n\reflection\ArgUtils;
use n2n\l10n\N2nLocale;
use n2n\l10n\TextCollectionLoader;
use n2n\core\N2N;

class DynamicTextCollection {
	const LANG_NS_EXT = 'lang';
	
	const REPLACEMENT_PREFIX = '[';
	const REPLACEMENT_SUFFIX = ']';
	
	private $n2nLocaleIds = array();
	private $langNamespaces = array();
	/**
	 * @param unknown $modules
	 * @param unknown $n2nLocales
	 * @param bool $fallbackToDefaultN2nLocale
	 */
	public function __construct($modules, $n2nLocales, bool $includeFallbackN2nLocale = true) {
		foreach (ArgUtils::toArray($n2nLocales) as $n2nLocale) {
			$this->assignN2nLocale($n2nLocale);
		}
		
		if ($includeFallbackN2nLocale) {
			$this->assignN2nLocale(N2nLocale::getFallback());
		}
		
		foreach (ArgUtils::toArray($modules) as $module) {
			$this->assignModule($module);
		}
	}
	
	public function getN2nLocaleIds() {
		return $this->n2nLocaleIds;
	}
	
	public function getLangNamespaces() {
		return $this->langNamespaces;
	}
	/**
	 * @param array $n2nLocales
	 */
	private function assignN2nLocales(array $n2nLocales) {
		foreach ($n2nLocales as $n2nLocale) {
			$this->assignN2nLocale($n2nLocale);
		}
	}
	/**
	 * @param mixed $n2nLocale
	 */
	public function assignN2nLocale($n2nLocale) {
		if (!($n2nLocale instanceof N2nLocale)) {
			$n2nLocale = new N2nLocale($n2nLocale);
		}
		
		$n2nLocaleId = $n2nLocale->getId();
		if (!isset($this->n2nLocaleIds[$n2nLocaleId])) {
			$this->n2nLocaleIds[$n2nLocaleId] = $n2nLocaleId;
		}
		
		$languageId = $n2nLocale->getLanguageId();
		if (!isset($this->n2nLocaleIds[$languageId])) {
			$this->n2nLocaleIds[$languageId] = $languageId;	
		}
	}
	
	private function buildModuleLangNs($module) {
		return trim((string) $module, '\\') . '\\' . self::LANG_NS_EXT;	
	}
	/**
	 * @param mixed $module
	 */
	public function assignModule($module) {
		$this->addLangNamespace($this->buildModuleLangNs($module));
	}
	
	public function addLangNamespace($langNamespace) {
		$this->langNamespaces[$langNamespace] = $langNamespace;
	}
	
	public function containsModule($module) {
		return isset($this->langNamespaces[$this->buildModuleLangNs($module)]);
	}
	/**
	 * @param unknown $code
	 * @param array $args
	 * @param int $num
	 * @param boolean $fallbackToCode
	 * @return string
	 */
	public function translate(string $code, array $args = null, int $num = null, array $replacements = null, bool $fallbackToCode = true) {
		foreach ($this->n2nLocaleIds as $n2nLocaleId) {
			$text = $this->translateForN2nLocale($n2nLocaleId, $code, (array) $args, $num);
			if ($text !== null) {
				return $this->replace($text, $replacements);
			}
		}
		
		if ($fallbackToCode) {
			return TextCollection::implode($code, (array) $args);
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
			foreach ($this->langNamespaces as $moduleNamespace) {
				$tc = TextCollectionLoader::loadIfExists($moduleNamespace . '\\' . self::LANG_NS_EXT . '\\' 
					. $n2nLocaleId);
				if ($tc !== null && $tc->has($textCode)) return true;
			}	
		}
		
		return false;
	}
}
