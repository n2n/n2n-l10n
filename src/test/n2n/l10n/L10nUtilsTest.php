<?php

namespace n2n\l10n;

use PHPUnit\Framework\TestCase;
use n2n\test\TestEnv;

class L10nUtilsTest extends TestCase {
	public function testFormatDateTimeWithIcuPattern() {
		$n2nLocale = TestEnv::getN2nContext()->getN2nLocale();

		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');
		
		$this->assertEquals('2022.4.1', L10nUtils::formatDateTimeWithIcuPattern($dateTimeImmutable, $n2nLocale, 'u.M.d'));
		$this->assertEquals('2022.4.1', L10nUtils::formatDateTimeWithIcuPattern($dateTime, $n2nLocale, 'u.M.d'));
	}

	public function testFormatDateTimeInput() {
		$n2nLocale = TestEnv::getN2nContext()->getN2nLocale();

		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');

		$this->assertEquals('Friday, April 1, 2022 at 12:00 AM', L10nUtils::formatDateTimeInput($dateTimeImmutable, $n2nLocale, DateTimeFormat::STYLE_FULL));
		$this->assertEquals('Friday, April 1, 2022 at 12:00 AM', L10nUtils::formatDateTimeInput($dateTime, $n2nLocale, DateTimeFormat::STYLE_FULL));
	}

	public function testFormatDateTime() {
		$n2nLocale = TestEnv::getN2nContext()->getN2nLocale();

		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');

		$this->assertEquals('4/1/22, 12:00 AM', L10nUtils::formatDateTime($dateTimeImmutable, $n2nLocale, DateTimeFormat::STYLE_SHORT));
		$this->assertEquals('4/1/22, 12:00 AM', L10nUtils::formatDateTime($dateTime, $n2nLocale, DateTimeFormat::STYLE_SHORT));
	}

	public function testFormatDate() {
		$n2nLocale = TestEnv::getN2nContext()->getN2nLocale();

		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');

		$this->assertEquals('Apr 1, 2022', L10nUtils::formatDate($dateTimeImmutable, $n2nLocale, DateTimeFormat::STYLE_MEDIUM));
		$this->assertEquals('Apr 1, 2022', L10nUtils::formatDate($dateTime, $n2nLocale, DateTimeFormat::STYLE_MEDIUM));
	}

	public function testFormatTime() {
		$n2nLocale = TestEnv::getN2nContext()->getN2nLocale();

		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022 22:20:02');
		$dateTime = new \DateTime('1.4.2022 22:20:02');

		$this->assertEquals('10:20:02 PM', L10nUtils::formatTime($dateTimeImmutable, $n2nLocale, DateTimeFormat::STYLE_MEDIUM));
		$this->assertEquals('10:20:02 PM', L10nUtils::formatTime($dateTime, $n2nLocale, DateTimeFormat::STYLE_MEDIUM));
	}
}