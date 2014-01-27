unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, TeEngine, Series,
  TeeProcs, Chart, Menus;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    ComboBox3: TComboBox;
    Label5: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Button2: TButton;
    GroupBox6: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Series1: TLineSeries;
    Chart1: TChart;
    Min: TLabel;
    Max: TLabel;
    ComboBox4: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox5: TComboBox;
    Edit7: TEdit;
    Edit8: TEdit;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    Edit9: TEdit;
    Edit10: TEdit;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    Timer2: TTimer;
    Timer1: TTimer;
    Timer3: TTimer;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure view_gen(stp:boolean;fl:byte;Sender: TObject);
    procedure view_os(stp:boolean;Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
DR=100;                              // Ранг дробления (количество точек по оси x)

var
  Form1: TForm1;
    mant_f,                          // Мантиса частоты
    mant_a_s,                        // Мантиса амплитуды синусоиды
    mant_a_t,                        // Мантиса амплитуды треугольного сигнала
    mant_a,                          // Мантиса амплитуды
    mant_t,                          // Мантиса развертки
    
    freq,                            // Переменная частоты
    amp_s,                           // Переменная амплитуды синус.
    faz,                             // Переменная фазы синуса
    amp_t,                           // Переменная амплитуды треуг.

    y_sin,                           // Перменные генератора синусоидального и
    y_t,                             // треугольного сигнала
    y_out,                           // Выходная переменная генератора
    t,                               // Переменная дискретизации генератора (для син.)
    tt,                              // Переменная дискретизации генератора (для треуг.)
    x,                               // Переменная развертки осциллографа
    dt,                              // Время(расстояние) между точками на графике (Величина шага по оси x)
    sum                              // Промежуточная переменная
    :extended;
    i:integer;                       // Переменная счетчик
// Флаги
    fl_1,                            // Флаг Вкл\Выкл генератора
    fl_2,                            // Флаг Вкл\Выкл осциллографа
    fl_3,                            // Флаг вывода окана ошибки при проверке данных вводимых в поля осциллографа
    fl_4,                            // Флагb вывода окана ошибки при проверке данных вводимых в поля генератора
    fl_5                             //
    :boolean;
    tempfile: TextFile;              // Файловая переменная (используется для хранения данных во временном файле)
    k:integer; // Отладка
implementation

{$R *.dfm}

procedure Tform1.view_gen(stp:boolean;fl:byte;Sender: TObject);      // Процедура блоктровки полей ввода генератора
begin                                                                // Маркер stp Вкл/Выкл поля
if stp then                                                          // fl флаг 0- частота
begin                                                                //         1- синус
  if fl=0 then                                                       //         2- треугольник
  begin
  Label1.Enabled:=False;
  Edit1.Enabled:=False;                                              // Выключение //
  UpDown1.Enabled:=False;
  ComboBox1.Enabled:=False;
  end;
  if fl=1 then
  begin
    Label2.Enabled:=False;
    Label3.Enabled:=False;
    Label4.Enabled:=False;
    Edit2.Enabled:=False;
    Edit3.Enabled:=False;
    UpDown2.Enabled:=False;
    UpDown3.Enabled:=False;
    ComboBox2.Enabled:=False;
  end;
  if fl=2 then
  begin
    Label5.Enabled:=False;
    Edit4.Enabled:=False;
    UpDown4.Enabled:=False;
    ComboBox3.Enabled:=False;
  end;
end else                                                              ///////////////
begin                                                                 // Включение //
  if fl=0 then                                                        // Частота
  begin
  Label1.Enabled:=True;
  Edit1.Enabled:=True;
  UpDown1.Enabled:=True;
  ComboBox1.Enabled:=True;
  end;
  if fl=1 then                                                        // Синус
  begin
    Label2.Enabled:=True;
    Label3.Enabled:=True;
    Label4.Enabled:=True;
    Edit2.Enabled:=True;
    Edit3.Enabled:=True;
    UpDown2.Enabled:=True;
    UpDown3.Enabled:=True;
    ComboBox2.Enabled:=True;
  end;
  if fl=2 then
  begin                                                              // Треугольник
    Label5.Enabled:=True;
    Edit4.Enabled:=True;
    UpDown4.Enabled:=True;
    ComboBox3.Enabled:=True;
  end;
end;
end;

procedure Tform1.view_os(stp:boolean;Sender: TObject);       // Процедура блоктровки полей осциллогафа
begin                                                        // Маркер stp Вкл/Выкл поля
if stp then
begin
  button3.Enabled:=False;
  button4.Enabled:=False;
end else
begin
  button3.Enabled:=True;
  button4.Enabled:=True;
end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of // В соответствии со значением индекса элемента
  0: mant_f:=1;             // ComboBox1 присваиваем значение мантисы частоты
  1: mant_f:=1000;
  2: mant_f:=1000000;
end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
case ComboBox2.ItemIndex of   // В соответствии со значением индекса элемента
  0: mant_a_s:=0.000001;      // ComboBox2 присваиваем значение мантисы амплитуды
  1: mant_a_s:=0.001;         // синусоидального сигнала
  2: mant_a_s:=1;
  3: mant_a_s:=1000;
  4: mant_a_s:=1000000;
end;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
case ComboBox3.ItemIndex of   // В соответствии со значением индекса элемента
  0: mant_a_t:=0.000001;      // ComboBox3 присваиваем значение мантисы амплитуды
  1: mant_a_t:=0.001;         // теугольного сигнала
  2: mant_a_t:=1;
  3: mant_a_t:=1000;
  4: mant_a_t:=1000000;
end;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
case ComboBox4.ItemIndex of   // В соответствии со значением индекса элемента
  0: mant_t:=0.000001;        // ComboBox4 присваиваем значение мантисы
  1: mant_t:=0.001;           // развертки
  2: mant_t:=1;
end;
end;


procedure TForm1.ComboBox5Change(Sender: TObject);
begin
case ComboBox5.ItemIndex of   // В соответствии со значением индекса элемента
  0: mant_a:=0.000001;        // ComboBox5 присваиваем значение мантисы
  1: mant_a:=0.001;           // амплитуды
  2: mant_a:=1;
  3: mant_a:=1000;
  4: mant_a:=1000000;
end;
end;


procedure TForm1.Timer2Timer(Sender: TObject);
var                    
Axsc_t_max:extended;
begin
  Axsc_t_max:=StrToFloat(Edit8.Text);                 // Считываем заначение максимума масштаба для оси х

  chart1.Serieslist[0].AddXY(x,y_out/mant_a);         // Построение точки
// Запись временных данных
  write(tempfile, x:10:5);                            // Запись во временный файл: времени,
  write(tempfile,'    ');                               // пробела,
  writeln(tempfile, y_out/mant_a:10:5);               // амплитуды  и преход на новую строку
/////////////////////////

// Развертка
  x:=x+dt/mant_t;                                     // Смещение точки по оси х на величину шага
  if x>Axsc_t_max then
  begin
    x:=0;
    Chart1.SeriesList[0].Clear;                       // Очистка графика
    Rewrite(tempfile);                                // Очистка временного файла
  end;
////////

end;

procedure TForm1.Button1Click(Sender: TObject);
var
x:Single;
begin

// Реализация Вкл/Выкл генератора одной кнопкой
  if fl_1 then                             // Проверка флага
  begin                                    // Выполнить если не включен //
    if not( TryStrToFloat(Edit1.Text, x) and                              // Проверка полей ввода на корректность
    TryStrToFloat(Edit2.Text, x) and  TryStrToFloat(Edit3.Text, x) and
    TryStrToFloat(Edit4.Text, x)) then
    ShowMessage('Данные некорректны')
    else
    begin

    freq:=StrToFloat(Edit1.Text)*mant_f;   // Считываем частоту
    amp_s:=StrToFloat(Edit2.Text)*mant_a_s;// Считываем амплитуду синуса
    faz:=StrToFloat(Edit3.Text);           // Считываем фазу синуса
    amp_t:=StrToFloat(Edit4.Text)*mant_a_t;// Считываем амплитуду треугольника
    dt:=1/(Freq*DR);                       // Расчитываем длительность дискрета

    // Инициализируем переменные
    t:=0;
    tt:=0;
    y_sin:=0;
    y_t:=amp_t;
    y_out:=0;
    sum:=0;
    i:=0;                                
    ////////
// Доступность полей ввода
    view_gen(True,0,Sender);               // Выключение доступности полей частоты (0)
    if checkbox1.Enabled then              // Проверка Вкл\Выкл синус ген.
       view_gen(True,1,Sender);            // Выключение доступности полей син.(1)
    if checkbox2.Enabled then              // Проверка Вкл\Выкл треуг ген.
       view_gen(True,2,Sender);            // Выключение доступности полей треуг.(2)
////////////////////////////

    timer1.Enabled:=True;                  // Включить генератор
    fl_1:=False;                           // Изменить значение флага

    Edit5.Text:='0';                       // Среднее значение, для всех сигналов заданных заданием оно равно нулю, так как все сигналы семетричны относительно оси коордитнат
    end
  end else                                 // Выполнить если включен    //
  begin
    timer1.Enabled:=False;                 // Выключить генератор
    Edit5.Text:='';                        // Очищаем поля вывода Среднего и СК значений
    Edit6.Text:='';                        //
    y_out:=0;                              // 0 на выходе генератора
    fl_1:=True;                            // Изменить значение флага
    view_gen(False,0,Sender);              // Включение доступности полей частоты (0)
    view_gen(False,1,Sender);              // Включение доступности полей син. (1)
    view_gen(False,2,Sender);              // Включение доступности полей треуг. (2)
  end;
//////////////////////////

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  kv,sk:extended;                      // Проммежуточные переменные
  x:Single;
begin

 if  Not CheckBox1.Checked then              // Сброс параметров синусоидального сигнала если он не включен
    begin
      t:=0;
      y_sin:=0;
      view_gen(False,1,Sender);              // Включение доступности полей син. (1)
      // Проверка вводимых данных
      if not (TryStrToFloat(Edit2.Text, x) and TryStrToFloat(Edit3.Text, x))then
      begin
      if fl_4 then                           // Для того что бы выводить окно ошибки ровно 1 раз (в противном случае бесконечное число раз)
      begin
        fl_4:=False;
        ShowMessage('Данные некорректны');
      end;
      end else
      begin
      fl_4:=True;
      amp_s:=StrToFloat(Edit2.Text)*mant_a_s;// Считываем амплитуду синуса
      faz:=StrToFloat(Edit3.Text);           // Считываем фазу синуса
      end;
    end;

 if  Not CheckBox2.Checked then              // Сброс параметров треугольного сигнала если он не включен
    begin
      tt:=0;
      y_t:=amp_t;
      view_gen(False,2,Sender);              // Включение доступности полей треуг. (2)
      // Проверка вводимых данных
      if not TryStrToFloat(Edit4.Text, x) then
      begin
      if fl_5 then                           // Для того что бы выводить окно ошибки ровно 1 раз (в противном случае бесконечное число раз)
      begin
        fl_5:=False;
        ShowMessage('Данные некорректны');
      end;
      end else
      begin
      fl_5:=True;
      amp_t:=StrToFloat(Edit4.Text)*mant_a_t;// Считываем амплитуду треугольника
      end;
    end;

 if CheckBox1.Checked or CheckBox2.Checked then
  begin
    if CheckBox1.Checked then                 // Генерация синуса
    begin
      view_gen(True,1,Sender);                // Выключение доступности полей син.(1)
      y_sin:=amp_s*sin(2*pi*freq*t+faz);
      t:=t+dt;
    end;

    if CheckBox2.Checked then                 // Генерация треугольника
    begin
      view_gen(True,2,Sender);                // Выключение доступности полей треуг.(2)
      if tt < (1/(2*freq))  then              // Формирование первого полупериода
        y_t:=y_t-4*amp_t*freq*dt;
      if tt >= (1/(2*freq)) then              // Формирование второго полупериода
        y_t:=y_t+4*amp_t*freq*dt;
      if tt>= 1/(freq)-dt then                   // Сброс переменных после генерации одного периода
      begin                                   // после происходит повторное формирование периода
        tt:=0;                                // таким образом организуем цикл генерации треугольного сигнала
        y_t:=amp_t;
      end;
      tt:=tt+dt;                              // Инкримирование переменной дискретизации на величину шага
    end;

 // Формирование выходного сигнала
    if  CheckBox1.Checked and CheckBox2.Checked then
      y_out:=y_sin+y_t                        // Сложный
    else if CheckBox1.Checked then
      y_out:=y_sin                            // Синус
    else if CheckBox2.Checked then
      y_out:=y_t;                             // Треугольник
 /////////////////////////////////////////
  end else
  begin
      y_out:=0;
  end;
// Вычисление среднеквадратического значения сигнала
  if i< DR then                        // Организуем цикл, для суммирования малых площадей (вычисляем интеграл)
  begin
    kv:=y_out*y_out;                   // Возводим в квадрат
    sum:=sum+kv*dt;                    // Увеличиваем буфферную переменную
  end else
  begin
    sk:=sqrt(freq*sum);                // Среднее квадратическое
    Edit6.Text:=FloatToStr(sk);        // Выводим в поле
    if i>=DR then                      // Сбрасывем значения
    begin
      i:=-1;
      sum:=0;
    end;  
  end;
  i:=i+1;                              // Увеличиваем переменную счетчика
////////////////////////////////////////////////////////////////////
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  x:=0;
// Реализация Вкл/Выкл осциллографа одной кнопкой
  if fl_2 then                             // Проверка флага
  begin
    chart1.Serieslist[0].Clear ;           // Очистка графика
    // Инициализация временного файла
    AssignFile(tempfile, 'C:\temp.txt');   // Ассациирование имени файла и файловой переменной
    Rewrite(tempfile);                     // Очистка временного файла
    view_os(False,Sender);
    /////////////////////////
    timer2.Enabled:=True;                  // Включить осциллограф
    fl_2:=False;                           // Изменить значение флага
    view_os(True,Sender);                  // Запретить доступ к кнопкам сохранения
  end else
  begin
    timer2.Enabled:=False;                 // Выключить осциллограф
    fl_2:=True;                            // Изменить значение флага
    view_os(False,Sender);                 // Разрешить доступ к кнопкам сохранения
  end;
//////////////////////////

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
// Инициализация
  timer1.Enabled:=False;                 // Выключить таймер осцилографа при запуске
  timer2.Enabled:=False;                 // Выключить таймер генератора  при запуске
  
  Chart1.LeftAxis.Automatic := False ;     // Отключение автомасштаба по оси у
  Chart1.BottomAxis.Automatic := False ;   // Отключение автомасштаба по оси х

  fl_1:=true;                            // Инициализация флага Вкл\Выкл генератора
  fl_2:=true;                            // Инициализация флага Вкл\Выкл осциллографа

  mant_a:=1;                             // Инициализация переменных мантис 
  mant_t:=1;
  mant_f:=1;
  mant_a_s:=1;
  mant_a_t:=1;

  y_out:=0;

  freq:=StrToFloat(Edit1.Text)*mant_f;   // Считываем частоту
  dt:=1/(Freq*DR);                       // Предварительно расчитываем длительность дискрета

  view_os(True,Sender);                  // Запрещаем доступ к кнопкам сохранения до первого запуска осциллографа
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
  st:string;                    // Буферная переменная
  Axsc_a_min,Axsc_a_max,                   // Переменные масштаба по осям координат,
  Axsc_t_min,Axsc_t_max                    // a(x) и t(y) соответственно
  :extended;
  x: Single;
begin
  if not (TryStrToFloat(Edit7.Text, x) and TryStrToFloat(Edit8.Text, x) and     // Проверка вводимых данных
  TryStrToFloat(Edit9.Text, x) and TryStrToFloat(Edit10.Text, x)) then
  begin
    if fl_3 then                           // Для того что бы выводить окно ошибки ровно 1 раз (в противном случае бесконечное число раз)
    begin
      fl_3:=False;
      ShowMessage('Данные некорректны');
    end;
  end else
  begin
  fl_3:=True;
  Axsc_a_min:=StrToFloat(Edit9.Text);      // Считываем заначение масштаба для оси y
  Axsc_a_max:=StrToFloat(Edit10.Text);     //
  Axsc_t_min:=StrToFloat(Edit7.Text);      // Считываем заначение масштаба для оси х
  Axsc_t_max:=StrToFloat(Edit8.Text);      //

  Chart1.LeftAxis.SetMinMax(Axsc_a_min,Axsc_a_max);//Задаем мастштаб по оси y
  Chart1.BottomAxis.SetMinMax(Axsc_t_min,Axsc_t_max);//Задаем мастштаб по оси x
  end;

case ComboBox4.ItemIndex of   // В соответствии со значением индекса элемента
  0: st:='мкС';
  1: st:='мС';
  2: st:='С';
end;
Chart1.BottomAxis.Title.Caption:=st; // Присваеваем размерность оси
case ComboBox5.ItemIndex of   // В соответствии со значением индекса элемента
  0: st:='мкВ';
  1: st:='мВ';
  2: st:='В';
  3: st:='кВ';
  4: st:='МВ';
end;
Chart1.LeftAxis.Title.Caption:=st; // Присваеваем размерность оси
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if Savedialog1.Execute                                       // Открытие диалога сохранения
  then Chart1.SaveToBitmapFile(savedialog1.FileName+'.bmp')  // Сохранение изображения
  else Exit;
showmessage('График успешно сохранен');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
outfile: TextFile;                                    // Файловая переменная
st:string;                                            // Строковая переменная
begin
if Savedialog2.Execute                                // Открытие диалога сохранения
  then
  begin
  CloseFile(tempfile);                                // Закрытие временного файла
  Reset(tempfile);                                    // Открытие временного файла для чтения
  AssignFile(outfile, savedialog2.FileName+'.txt');   // Ассациирование имени файла и файловой переменной
  Rewrite(outfile);                                   // Очитска файла
  write(outfile, 'Время [');                          // Запись заголовка в файл
  write(outfile,Chart1.BottomAxis.Title.Caption:3,']    ');  // 15 символов
  write(outfile, 'Амплитуда  [');
  writeln(outfile, Chart1.LeftAxis.Title.Caption:3,']');
  writeln(outfile, '_______________________________');             

  While not EOF(tempfile) do                          // Запись циклом построчно элементов временного файла в конечный файл
  begin
  readln(tempfile, st);
  writeln(outfile, st);
  end;
  CloseFile(outfile);                                 // Закрытие файлов
  CloseFile(tempfile);                                // 
  end else Exit;
showmessage('Данные успешно сохранены');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
CloseFile(tempfile);                                 // Закрываем временный файл
Erase(tempFile);                                     // Удаляем временный файл
end;

end.




