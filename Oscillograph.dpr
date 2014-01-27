program Oscillograph;

uses
  Forms,
  Unit1 in '..\1\Unit1.pas' {Form1},
  Unit2 in '..\1\Unit2.pas' {Frame2: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
