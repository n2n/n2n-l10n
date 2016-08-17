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

class N2nLocale {
	private $id;
	/**
	 * 
	 * @param string $n2nLocaleExpression
	 * @throws IllegalN2nLocaleFormatException
	 */
	public function __construct(string $n2nLocaleId) {
		if (2 > strlen($n2nLocaleId)) {
			throw new IllegalN2nLocaleFormatException('Invalid locale id: ' . $n2nLocaleId);
		}
		// @todo parseN2nLocale
		
		$this->id = (string) $n2nLocaleId;
	}
	/**
	 * 
	 * @return string
	 */
	public function getId() {
		return $this->id;
	}
	/**
	 * 
	 * @param string $displayN2nLocale
	 * @return string
	 */
	public function getName($displayN2nLocale = null) {
		if (!L10nUtils::isL10nSupportAvailable()) {
			return $this->id;
		}
		
		if (isset($displayN2nLocale)) {
			return \Locale::getDisplayName($this->id, $displayN2nLocale);
		}
		return \Locale::getDisplayName($this->id);
	}
	/**
	 * 
	 * @return string
	 */
	public function getLanguageId() {
		if (L10nUtils::isL10nSupportAvailable()) {
			return \Locale::getPrimaryLanguage($this->id);
		}
		return mb_substr($this->id, 0, 2);
	}
	/**
	 * 
	 * @return Language
	 */
	public function getLanguage() {
		return new Language($this->getLanguageId());
	}
	/**
	 * 
	 * @return string
	 */
	public function getRegionId() {
		return Region::parseId($this->id);
	}
	/**
	 * 
	 * @return Region
	 */
	public function getRegion() {
		$regionId = $this->getRegionId();
		if (isset($regionId)) {
			return new Region($this->id); 
		}
		return null;
	}
	/**z
	 * 
	 * @param string $o
	 * @return boolean
	 */
	public function equals($o) {
		return $o instanceof N2nLocale && $o->getId() == $this->getId();
	}
	
	/**
	 * ISO 639-1 - ISO 3166-1 Alpha 2
	 * @return string
	 */
	public function toHttpId() {
		return mb_strtolower(str_replace('_', '-', $this->getId()));
	}
	
	public function toPrettyId() {
		$str =  mb_strtoupper($this->getLanguageId());

		 if (null !== ($regionId = $this->getRegionId())) {
		 	$str .=  ' (' . mb_strtoupper($regionId) . ')';
		 }
		 
		 return $str;
	}
	
	public function __toString(): string {
		return $this->id;
	}
	/**
	 * @param string $httpN2nLocaleShort
	 * @throws IllegalN2nLocaleFormatException
	 */
	public static function parseHttpN2nLocaleId($httpN2nLocaleShort) {
		if (mb_strlen($httpN2nLocaleShort) < 2) {
			throw new IllegalN2nLocaleFormatException('Invalid http locale id: ' . $httpN2nLocaleShort);
		}
		
		return str_replace('-', '_', mb_substr($httpN2nLocaleShort, 0, 3) . mb_strtoupper(mb_substr($httpN2nLocaleShort, 3, 2)));
	}
	
	public static function acceptFromHttp($httpAcceptLanguage) {
		if (L10nUtils::isL10nSupportAvailable()) {
			return \Locale::acceptFromHttp($_SERVER['HTTP_ACCEPT_LANGUAGE']);
		}
		return null;
	}
	
	private static $defaultN2nLocale = null;
	
	public static function setDefault(N2nLocale $defaultN2nLocale) {
		if (L10nUtils::isL10nSupportAvailable()) {
			\Locale::setDefault((string) $defaultN2nLocale);
		}
		
		self::$defaultN2nLocale = $defaultN2nLocale;
	}
	
	public static function getDefault(): N2nLocale {
		if (self::$defaultN2nLocale !== null) {
			return self::$defaultN2nLocale;
		}
		
		if (L10nUtils::isL10nSupportAvailable()) {
			return self::$defaultN2nLocale = new N2nLocale(\Locale::getDefault());
		}
		
		return self::getFallback();
	}
	
	private static $fallbackN2nLocale = null;
	
	public static function setFallback(N2nLocale $fallbackN2nLocale) {
		self::$fallbackN2nLocale = $fallbackN2nLocale;
	}
	
	public static function getFallback(): N2nLocale {
		if (self::$fallbackN2nLocale === null) {
			self::$fallbackN2nLocale = new N2nLocale('en');
		}
		
		return self::$fallbackN2nLocale;
	}
	
	private static $adminN2nLocale = null;
	
	public static function getAdmin(): N2nLocale {
		if (self::$adminN2nLocale === null) {
			return self::getDefault();
		}
	
		return self::$adminN2nLocale;
	}
	
	public static function setAdmin(N2nLocale $adminN2nLocale) {
		self::$adminN2nLocale = $adminN2nLocale;
	}
	
	
	/**
	 * @param mixed $expression
	 * @return \n2n\l10n\N2nLocale
	 */
	public static function create($expression): N2nLocale {
		if ($expression instanceof N2nLocale) return $expression;
		return new N2nLocale($expression);
	}
	
	public static function build($expression) {
		if ($expression === null || $expression instanceof N2nLocale) return $expression;
		return new N2nLocale($expression);
	}
	
	public static function createFromHttpId(string $n2nLocaleHttpId) {
		return new N2nLocale(self::parseHttpN2nLocaleId($n2nLocaleHttpId));
	}
}
