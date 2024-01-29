unit TestRTL.Main;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestRTL = class
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // Sample Methods
    // Simple single Test
    [Test]
    [TestCase('Test Currency.ToString with FormatSettings.CurrencyDecimals', '')]
    procedure Test1;

//    // Test with TestCase Attribute to supply parameters.
//    [Test]
//    [TestCase('TestA','1,2')]
//    [TestCase('TestB','3,4')]
//    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

uses
  System.SysUtils;

procedure TTestRTL.Setup;
begin
end;

procedure TTestRTL.TearDown;
begin
end;

procedure TTestRTL.Test1;
var
  MyCurr: Currency;
  LResult: string;
  LSavedFormatSettings: TFormatSettings;
begin
  LSavedFormatSettings := FormatSettings;

  FormatSettings.CurrencyDecimals := 2;
  MyCurr := 1.50;
  LResult := MyCurr.ToString;
  FormatSettings := LSavedFormatSettings;

  Assert.IsTrue(LResult = '$1.50');

end;

//procedure TTestRTL.Test2(const AValue1 : Integer;const AValue2 : Integer);
//begin
//end;

initialization
  TDUnitX.RegisterTestFixture(TTestRTL);

end.
