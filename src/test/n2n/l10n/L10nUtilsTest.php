<?php

namespace n2n\l10n;

use PHPUnit\Framework\TestCase;
use n2n\test\TestEnv;

class L10nUtilsTest extends TestCase {
	private N2nLocale $n2nLocale;

	public function setUp(): void {
		$this->n2nLocale = new N2nLocale('en_US');
	}

	public function testFormatDateTimeWithIcuPattern() {
		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');
		
		$this->assertEquals('2022.4.1', L10nUtils::formatDateTimeWithIcuPattern($dateTimeImmutable, $this->n2nLocale, 'u.M.d'));
		$this->assertEquals('2022.4.1', L10nUtils::formatDateTimeWithIcuPattern($dateTime, $this->n2nLocale, 'u.M.d'));
	}

	public function testFormatDateTimeInput() {
		$this->markTestSkipped('N2N core not part of l10n');
		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');

		$this->assertEquals('Friday, April 1, 2022 at 12:00 AM', L10nUtils::formatDateTimeInput($dateTimeImmutable, $this->n2nLocale, DateTimeFormat::STYLE_FULL));
		$this->assertEquals('Friday, April 1, 2022 at 12:00 AM', L10nUtils::formatDateTimeInput($dateTime, $this->n2nLocale, DateTimeFormat::STYLE_FULL));
	}

	public function testFormatDateTime() {
		$this->markTestSkipped('N2N core not part of l10n');
		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');

		$this->assertEquals('4/1/22, 12:00 AM', L10nUtils::formatDateTime($dateTimeImmutable, $this->n2nLocale, DateTimeFormat::STYLE_SHORT));
		$this->assertEquals('4/1/22, 12:00 AM', L10nUtils::formatDateTime($dateTime, $this->n2nLocale, DateTimeFormat::STYLE_SHORT));
	}

	public function testFormatDate() {
		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022');
		$dateTime = new \DateTime('1.4.2022');

		$this->assertEquals('Apr 1, 2022', L10nUtils::formatDate($dateTimeImmutable, $this->n2nLocale, DateTimeFormat::STYLE_MEDIUM));
		$this->assertEquals('Apr 1, 2022', L10nUtils::formatDate($dateTime, $this->n2nLocale, DateTimeFormat::STYLE_MEDIUM));
	}

	public function testFormatTime() {
		$this->markTestSkipped('Weird ci-bob problems detected.');

		$dateTimeImmutable = new \DateTimeImmutable('1.4.2022 22:20:02');
		$dateTime = new \DateTime('1.4.2022 22:20:02');

		$this->assertEquals('10:20:02 PM', L10nUtils::formatTime($dateTimeImmutable, $this->n2nLocale, DateTimeFormat::STYLE_MEDIUM));
		$this->assertEquals('10:20:02 PM', L10nUtils::formatTime($dateTime, $this->n2nLocale, DateTimeFormat::STYLE_MEDIUM));
	}
}