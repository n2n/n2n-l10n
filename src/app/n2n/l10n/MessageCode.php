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

class MessageCode extends Message {
	private $textCode;
	private $args;
	private $num;
	private $moduleNamespace;
	
	public function __construct($textCode, array $args = null, $severity = null, $moduleNamespace = null, $num = null) {
		parent::__construct($textCode . ' [' . implode(', ', (array) $args) . ']', $severity);
		
		$this->textCode = (string) $textCode;
		$this->args = (array) $args;
		$this->num = $num;
		if ($moduleNamespace !== null) {
			$this->moduleNamespace = (string) $moduleNamespace;
		}
	}
	
	public function setTextCode($textCode) {
		$this->textCode = $textCode;
	}
	
	public function getTextCode() {
		return $this->textCode;
	}
	
	public function getArgs() {
		return $this->args;
	}
	
	public function setArgs(array $args) {
		$this->args = $args;
	}
	
	public function getNum() {
		return $this->num;
	}
	
	public function setNum($num) {
		$this->num = $num;
	}
	
	public function setModuleNamespace($moduleNamespace) {
		$this->moduleNamespace = $moduleNamespace;
	}
	
	public function getModuleNamespace() {
		return $this->moduleNamespace;
	}
}
