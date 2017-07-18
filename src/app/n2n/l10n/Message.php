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

class Message {
	const SEVERITY_SUCCESS = 1;
	const SEVERITY_INFO = 2;
	const SEVERITY_WARN = 4;
	const SEVERITY_ERROR = 8;
	const ALL_SEVERITIES = 15;
	
	private $text;
	private $severity;
	private $processed = false;
	
	public function __construct($text, $severity = null) {
		if (is_null($severity)) $severity = self::SEVERITY_ERROR;
		
		$this->text = $text;
		$this->severity = $severity;
	}
	
	public function getSeverity() {
		return $this->severity;
	}
	
	public function setSeverity($severity) {
		$this->severity = $severity;
	} 
	
	public function isProcessed(): bool {
		return $this->processed;
	}
	
	public function setProcessed(bool $processed) {
		$this->processed = $processed;
	}
	
	public function __toString(): string {
		return $this->text;
	}
	
	public static function createFromExpression($messageExpression) {
		if ($messageExpression instanceof Message) return $messageExpression;
		
		return new Message((string) $messageExpression);
	}
}
