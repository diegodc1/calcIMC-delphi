program Project3;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  tabela in 'tabela.pas' {infoTable};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TinfoTable, infoTable);
  Application.Run;
end.
