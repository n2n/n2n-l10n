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

class Lstr {
	protected $textOrCode;
	protected $moduleNamespace;
	protected $args = null;
	protected $num = null;
	protected $fallbackToCode = true;
	
	public function __construct(string $textOrCode, string $moduleNamespace = null) {
		$this->textOrCode = $textOrCode;
		$this->moduleNamespace = $moduleNamespace;
	}
	
	public function t(N2nLocale $n2nLocale) {
		if ($this->moduleNamespace === null) {
			return $this->textOrCode;
		}
		
		$dtc = new DynamicTextCollection($this->moduleNamespace, $n2nLocale);
		return $dtc->translate($this->textOrCode, $this->args, $this->num, null, $this->fallbackToCode);
	}
	
	public function __toString() {
		return $this->textOrCode;
	}
	
	public static function create($arg): Lstr {
		if ($arg instanceof Lstr) return $arg;
		
		return new Lstr((string) $arg);
	}
}
