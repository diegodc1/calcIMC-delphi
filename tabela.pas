unit tabela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TinfoTable = class(TForm)
    Image1: TImage;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  infoTable: TinfoTable;

implementation

{$R *.dfm}

end.
