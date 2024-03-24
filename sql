create database library;

use library;
create table uyeler(
uye_no int primary key,
uye_ad nvarchar(50),
uye_soyad nvarchar(50),
cinsiyet char(5),
e_posta varchar(100),
telefon int
);

create table adresler(
adres_no int primary key,
sehir nvarchar(50),
mahalle nvarchar(50),
cadde nvarchar(100),
bina_no int ,
posta_kodu int,
ulke nvarchar(50)
);

create table kutuphane(
kutuphahe_no int primary key,
adres_no int,
telefon_no int,
e_posta nvarchar(50)
constraint adres_no_pk foreign key (adres_no) references adresler([adres_no])
);

create table kategori(
kategori_no int primary key,
kategori_ad nvarchar(50)
);        

create table yazarlar(
yazar_no int primary key,
yazar_adi nvarchar(50),
yazar_soyadi nvarchar(50)
);

create table kitaplar(
kitap_no int primary key,
kitap_adi nvarchar(50),
isbn nvarchar(50),
sayfa_sayisi int,
yazar_no int ,
kategori_no int 
constraint yazar_no_fk foreign key (yazar_no) references yazarlar ([yazar_no]),
constraint kategori_no_fk foreign key (kategori_no) references kategori([kategori_no]),
);

create table emanet_kitaplar(
emanet_no int primary key,
uye_no int,
kitap_no int,
miktar int,
emanet_tarihi datetime,
teslim_tarihi datetime
constraint kitap_no_fk foreign key (kitap_no) references kitaplar ([kitap_no]),
constraint uye_no_fk foreign key (uye_no) references uyeler([uye_no]),
);

create table emanet_gecmis (
    emanet_no int,
    kitap_no int,
    uye_no int,
    teslim_tarihi date,
    gecikme_bedeli decimal(10, 3),
    constraint emanet_no_fk foreign key (emanet_no) references emanet_kitaplar ([emanet_no]),
    constraint kitapp_no_fk foreign key (kitap_no) references kitaplar ([kitap_no]),
    constraint uyee_no_fk foreign key (uye_no) references uyeler([uye_no]),
);

create table kitap_yazar (
    kitap_no int,
    yazar_no int,
    constraint kitapp_no_fk foreign key (kitap_no) references kitaplar ([kitap_no]),
    constraint yazarr_no_fk foreign key (yazar_no) references yazarlar([yazar_no]),
);

create table kategori_kitap (
    kitap_no int,
    kategori_no int,
    constraint kitappp_no_fk foreign key (kitap_no) references kitaplar ([kitap_no]),
    constraint kategorii_no_fk foreign key (kategori_no) references kategori([kategori_no]),
);