// Adapted from the original source code written by Abhishek Dubey
// http://www.c-sharpcorner.com/UploadFile/433c33/creating-analog-clock-in-java/
//
// This Lazarus source code is available from
// http://lazplanet.blogspot.com
//
// Enjoy!
unit frm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure DrawHands;
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

  xcenter:integer = 175;
  ycenter:integer = 175;
  lastxs,lastys,lastxm,lastym,lastxh,lastyh:integer;

  clockbg: tbitmap;

  second, minute, hour: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  clockbg:=tbitmap.Create;
  clockbg.SetSize(350,350);
  with clockbg.Canvas do begin
    // background clearing
    Brush.Color:=RGBToColor(0,90,82);
    FillRect(0,0,350,350);

    // clock area
    Brush.Color:=clBlack;
    Ellipsec(xcenter, ycenter, 150, 150);

    // draw numbers...
    Font.Color:=clRed;
    Brush.Style:=bsClear;
    TextOut(xcenter - 145, ycenter - 5, '9');
    TextOut(xcenter + 135, ycenter - 5, '3');
    TextOut(xcenter - 5, ycenter - 145, '12');
    TextOut(xcenter - 5, ycenter + 130, '6');

    // draw the points in between numbers (hour marks)
    Brush.Style:=bsSolid;
    Brush.Color:=clLime;
    // 1
    EllipseC(
      round(cos((1 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((1 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 2
    EllipseC(
      round(cos((2 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((2 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 4
    EllipseC(
      round(cos((4 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((4 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 5
    EllipseC(
      round(cos((5 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((5 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 7
    EllipseC(
      round(cos((7 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((7 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 8
    EllipseC(
      round(cos((8 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((8 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 10
    EllipseC(
      round(cos((10 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((10 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);
    // 11
    EllipseC(
      round(cos((11 * 30) * pi / 180 - pi / 2) * 140 + xcenter),
      round(sin((11 * 30) * pi / 180 - pi / 2) * 140 + ycenter),
      3,3);

  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if clockbg <> nil then
    FreeAndNil(clockbg);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if clockbg <> nil then begin
    Canvas.Draw(0,0,clockbg);

    DrawHands;

    Canvas.TextOut(xcenter - 30, ycenter + 155,
      FormatDateTime('hh:nn:ss am/pm', now));
  end;
end;

procedure Tform1.DrawHands();
var
  HH,MM,SS,MS: Word;
  xhour, yhour, xminute, yminute, xsecond, ysecond, second, minute, hour: Integer;
  cSecond, cMinute, cHour: TColor;
begin
  // hand colors
  cSecond:=clGreen;
  cMinute:=clBlue;
  cHour:=clRed;

  // get the time
  DecodeTime(Time,HH,MM,SS,MS);
  second:=SS;
  minute:=MM;
  hour:=HH;

  // calculation of (x, y) points where the hands will point to
  xsecond := round(cos(second * pi / 30 - pi / 2) * 120 + xcenter);
  ysecond := round(sin(second * pi / 30 - pi / 2) * 120 + ycenter);
  xminute := round(cos(minute * pi / 30 - pi / 2) * 100 + xcenter);
  yminute := round(sin(minute * pi / 30 - pi / 2) * 100 + ycenter);
  xhour := round(cos((hour * 30 + minute / 2) * pi / 180 - pi / 2) * 80 + xcenter);
  yhour := round(sin((hour * 30 + minute / 2) * pi / 180 - pi / 2) * 80 + ycenter);

  with Canvas do begin
    // second hand
    {Pen.Color:=cSecond;
    if ((xsecond <> lastxs) or (ysecond <> lastys)) then
       Line(xcenter, ycenter, lastxs, lastys);}

    // minute hand
    {Pen.Color:=cMinute;
    if ((xminute <> lastxm) or (yminute <> lastym)) then begin
      Line(xcenter, ycenter - 1, lastxm, lastym);
      Line(xcenter - 1, ycenter, lastxm, lastym);
    end;}

    // hour hand
    {Pen.Color:=cHour;

    if ((xhour <> lastxh) or (yhour <> lastyh)) then begin
      Line(xcenter, ycenter - 1, lastxh, lastyh);
      Line(xcenter - 1, ycenter, lastxh, lastyh);
    end;}

    // drawing the hands
    pen.Color:=cSecond;
    Line(xcenter, ycenter, xsecond, ysecond);
    pen.Color:=cMinute;
    Line(xcenter, ycenter - 1, xminute, yminute);
    Line(xcenter - 1, ycenter, xminute, yminute);
    pen.Color:=cHour;
    Line(xcenter, ycenter - 1, xhour, yhour);
    Line(xcenter - 1, ycenter, xhour, yhour);

  end;

  // some info we can use later...
  lastxs := xsecond;
  lastys := ysecond;
  lastxm := xminute;
  lastym := yminute;
  lastxh := xhour;
  lastyh := yhour;
end;

end.

