unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TForm3 = class(TForm)
    edtWeight: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtHeight: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    panelResult: TPanel;
    Image1: TImage;
    panelResultNumber: TPanel;
    Label3: TLabel;
    btnClear: TSpeedButton;
    btnCalc: TSpeedButton;
    Image3: TImage;
    memoResult: TMemo;
    Image2: TImage;
    procedure btnCalcClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses tabela;

procedure TForm3.btnCalcClick(Sender: TObject);

function Trunca(const Valor:Double; Decimais:Integer = 2): Double;

var
  I, C  : Integer;
  S, S2 : String;
  V     : Boolean;

begin
  S := FloatToStr(Valor);
  C := 0; V := False;

  For I := 1 to Length(S) do
  begin
    if not V then V := S[I] = ',';
    S2 := S2 + S[I];
    if V then Inc(C);
    if C > Decimais then Break;
  end;
  Result := StrToFloat(S2);
end;


var
  weight, height, result:double;
  msg:string;
  text:array[1..10] of string;


begin
  msg := 'O que pode acontecer:';
  text[1] := 'Queda de cabelo, infertilidade, ausência menstrual';
  text[2] := 'Fadiga, stress, ansiedade';
  text[3] := 'Menor risco de doenças cardíacas e vasculares';
  text[4] := 'Fadiga, má circulação, varizes';
  text[5] := 'Diabetes, angina, infarto, aterosclerose';
  text[6] := 'Apneia do sono, falta de ar';
  text[7] := 'Refluxo, dificuldade para se mover, escaras, diabetes, infarto, AVC';

  if(edtWeight.text <> '') and (edtHeight.text <> '') then
    Begin
       weight := StrToFloat(edtWeight.Text);
       height := StrToFloat(edtHeight.Text);

       result := weight / (height * height);

       memoResult.Clear;
       panelResult.Caption := '';
       panelResult.Color := clBtnFace;
       panelResultNumber.Caption := '0';





       if (result >= 10) and (result <= 16.9)  then
        Begin
          panelResult.Caption := 'Muito abaixo do peso';
          panelResult.Color := clHotLight;
          result := Trunca(result);
          panelResultNumber.Caption := FloatToStr(result);

          memoResult.Lines.Add(msg);
          memoResult.Lines.Add('');
          memoResult.Lines.add(text[1]);
        End else
       if (result >= 17) and (result <= 18.4)then
        Begin
          panelResult.Caption := 'Abaixo do peso';
          panelResult.Color := clHighLight;
          result := Trunca(result);
          panelResultNumber.Caption := FloatToStr(result);

          memoResult.Lines.Add(msg);
          memoResult.Lines.Add('');
          memoResult.Lines.add(text[2]);
        End else
       if (result >= 18.5) and (result <= 24.9)then
        Begin
          panelResult.Caption := 'Peso normal';
          panelResult.Color := clGreen;
          result := Trunca(result);
          panelResultNumber.Caption := FloatToStr(result);

          memoResult.Lines.Add(msg);
          memoResult.Lines.Add('');
          memoResult.Lines.add(text[3]);
        End else
       if (result >= 25) and (result <= 29.9)then
        Begin
          panelResult.Caption := 'Acima do peso';
          panelResult.Color := clYellow;
          result := Trunca(result);
          panelResultNumber.Caption := FloatToStr(result);

          memoResult.Lines.Add(msg);
          memoResult.Lines.Add('');
          memoResult.Lines.add(text[4]);
        End else
       if (result >= 30) and (result <= 34.9) then
         Begin
           panelResult.Caption := 'Obesidade Grau I';
           panelResult.Color := clMaroon;
           result := Trunca(result);
           panelResultNumber.Caption := FloatToStr(result);

           memoResult.Lines.Add(msg);
           memoResult.Lines.Add('');
           memoResult.Lines.add(text[5]);
         End else
       if (result >= 35) and (result <= 40) then
         Begin
           panelResult.Caption := 'Obesidade Grau II';
           panelResult.Color := clPurple;
           result := Trunca(result);
           panelResultNumber.Caption := FloatToStr(result);

           memoResult.Lines.Add(msg);
           memoResult.Lines.Add('');
           memoResult.Lines.add(text[6]);
         End else
       if (result > 40) and (result < 90) then
         Begin
           panelResult.Caption := 'Obesidade Grau III';
           panelResult.Color := clRed;
           result := Trunca(result);
           panelResultNumber.Caption := FloatToStr(result);

           memoResult.Lines.Add(msg);
           memoResult.Lines.Add('');
           memoResult.Lines.add(text[7]);
         End else if (result < 10) and (result > 90) then
          Begin
            ShowMessage('Valor Inválido. Digite novamente!');
            edtWeight.SetFocus;
          End else
            Begin
              ShowMessage('Valor Inválido. Digite novamente!');
              edtWeight.SetFocus;
            End;
    End
  else
    Begin
      ShowMessage('Preencha os campos!');
      edtWeight.SetFocus;
    End;

end;


procedure TForm3.btnClearClick(Sender: TObject);
begin
  edtWeight.Clear;
  edtHeight.Clear;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
  infoTable.showModal;
end;

end.
