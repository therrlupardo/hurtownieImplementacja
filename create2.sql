USE [master]
GO
/****** Object:  Database [StudioArchitektoniczne]    Script Date: 19.11.2019 23:47:12 ******/
CREATE DATABASE [StudioArchitektoniczne]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudioArchitektoniczne', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudioArchitektoniczne.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudioArchitektoniczne_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudioArchitektoniczne_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudioArchitektoniczne] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudioArchitektoniczne].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudioArchitektoniczne] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudioArchitektoniczne] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudioArchitektoniczne] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudioArchitektoniczne] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudioArchitektoniczne] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET RECOVERY FULL 
GO
ALTER DATABASE [StudioArchitektoniczne] SET  MULTI_USER 
GO
ALTER DATABASE [StudioArchitektoniczne] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudioArchitektoniczne] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudioArchitektoniczne] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudioArchitektoniczne] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudioArchitektoniczne] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudioArchitektoniczne', N'ON'
GO
ALTER DATABASE [StudioArchitektoniczne] SET QUERY_STORE = OFF
GO
USE [StudioArchitektoniczne]
GO
/****** Object:  Table [dbo].[Daty]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daty](
	[ID_data] [int] NOT NULL,
	[Rok] [nchar](4) NULL,
	[Miesiac] [nvarchar](20) NULL,
	[Data] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[ID_klient] [int] NOT NULL,
	[Nazwa] [nvarchar](30) NULL,
	[ImieNazwisko] [nvarchar](90) NOT NULL,
	[Typ_klienta] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nadzory_architektoniczne]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nadzory_architektoniczne](
	[ID_nadzor_architektoniczny] [int] NOT NULL,
	[Czas_oczekiwania_na_zakonczenie] [smallint] NULL,
	[Wielkosc] [smallint] NULL,
	[Koszt] [int] NULL,
	[ID_termin_rozpoczecia] [int] NOT NULL,
	[ID_termin_zakonczenia] [int] NOT NULL,
	[ID_pracownik] [int] NOT NULL,
	[ID_kierownik_budowy] [int] NOT NULL,
	[ID_szczegoly_nadzoru] [int] NOT NULL,
	[ID_projekt_architektoniczny] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_nadzor_architektoniczny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[ID_pracownik] [int] NOT NULL,
	[PESEL] [nchar](11) NOT NULL,
	[ImieNazwisko] [varchar](90) NOT NULL,
	[Specjalizacja] [varchar](90) NOT NULL,
	[Uprawnienia_do_nadzoru] [varchar](50) NOT NULL,
	[ID_przelozony] [int] NULL,
	[Data_wstawnienia] [date] NOT NULL,
	[Data_wygasnecia] [date] NULL,
 CONSTRAINT [PK__Pracowni__4AE49B6E877EE4CD] PRIMARY KEY CLUSTERED 
(
	[ID_pracownik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_zewnetrzni]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_zewnetrzni](
	[ID_pracownik_zewnetrzny] [int] NOT NULL,
	[ImieNazwisko] [nvarchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pracownik_zewnetrzny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekty_architektoniczne]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekty_architektoniczne](
	[ID_projekt_architektoniczny] [int] NOT NULL,
	[Czas_oczekiwania_na_rozpoczecie] [smallint] NULL,
	[Czas_oczekiwania_na_zakonczenie] [smallint] NULL,
	[Wielkosc] [smallint] NULL,
	[Cena] [int] NULL,
	[Ostateczna_cena] [int] NULL,
	[ID_data_przyjecia_do_realizacji] [int] NOT NULL,
	[ID_termin_rozpoczecia] [int] NOT NULL,
	[ID_termin_zakonczenia] [int] NOT NULL,
	[ID_klient] [int] NOT NULL,
	[ID_szczegoly_projektu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_projekt_architektoniczny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Szczegoly_nadzoru]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Szczegoly_nadzoru](
	[ID_szczegoly_nadzoru] [int] NOT NULL,
	[Dlugosc_trwania] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_szczegoly_nadzoru] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Szczegoly_projektu]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Szczegoly_projektu](
	[ID_szczegoly_projektu] [int] NOT NULL,
	[Typ_projektu] [nvarchar](30) NOT NULL,
	[Czy_nadzorowano] [nvarchar](20) NOT NULL,
	[Dlugosc_trwania] [nvarchar](30) NOT NULL,
	[Obciazenie_nadzorami] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__Szczegol__28E9A05D721B2384] PRIMARY KEY CLUSTERED 
(
	[ID_szczegoly_projektu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wykonane_projekty]    Script Date: 19.11.2019 23:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wykonane_projekty](
	[ID_pracownik] [int] NOT NULL,
	[ID_projekt] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pracownik] ASC,
	[ID_projekt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_kierownik_budowy])
REFERENCES [dbo].[Pracownicy_zewnetrzni] ([ID_pracownik_zewnetrzny])
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD  CONSTRAINT [FK__Nadzory_a__ID_pr__6383C8BA] FOREIGN KEY([ID_pracownik])
REFERENCES [dbo].[Pracownicy] ([ID_pracownik])
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne] CHECK CONSTRAINT [FK__Nadzory_a__ID_pr__6383C8BA]
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_projekt_architektoniczny])
REFERENCES [dbo].[Projekty_architektoniczne] ([ID_projekt_architektoniczny])
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_szczegoly_nadzoru])
REFERENCES [dbo].[Szczegoly_nadzoru] ([ID_szczegoly_nadzoru])
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_termin_rozpoczecia])
REFERENCES [dbo].[Daty] ([ID_data])
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_termin_zakonczenia])
REFERENCES [dbo].[Daty] ([ID_data])
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_data_przyjecia_do_realizacji])
REFERENCES [dbo].[Daty] ([ID_data])
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_klient])
REFERENCES [dbo].[Klienci] ([ID_klient])
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD  CONSTRAINT [FK__Projekty___ID_sz__5441852A] FOREIGN KEY([ID_szczegoly_projektu])
REFERENCES [dbo].[Szczegoly_projektu] ([ID_szczegoly_projektu])
GO
ALTER TABLE [dbo].[Projekty_architektoniczne] CHECK CONSTRAINT [FK__Projekty___ID_sz__5441852A]
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_termin_rozpoczecia])
REFERENCES [dbo].[Daty] ([ID_data])
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD FOREIGN KEY([ID_termin_zakonczenia])
REFERENCES [dbo].[Daty] ([ID_data])
GO
ALTER TABLE [dbo].[Wykonane_projekty]  WITH CHECK ADD  CONSTRAINT [FK__Wykonane___ID_pr__571DF1D5] FOREIGN KEY([ID_pracownik])
REFERENCES [dbo].[Pracownicy] ([ID_pracownik])
GO
ALTER TABLE [dbo].[Wykonane_projekty] CHECK CONSTRAINT [FK__Wykonane___ID_pr__571DF1D5]
GO
ALTER TABLE [dbo].[Wykonane_projekty]  WITH CHECK ADD FOREIGN KEY([ID_projekt])
REFERENCES [dbo].[Projekty_architektoniczne] ([ID_projekt_architektoniczny])
GO
ALTER TABLE [dbo].[Daty]  WITH CHECK ADD CHECK  (([ID_data]>=(0)))
GO
ALTER TABLE [dbo].[Klienci]  WITH CHECK ADD CHECK  (([ID_klient]>=(0)))
GO
ALTER TABLE [dbo].[Klienci]  WITH CHECK ADD CHECK  (([Typ_klienta]='ORGANIZACJA' OR [Typ_klienta]='INDYWIDUALNY'))
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD CHECK  (([Czas_oczekiwania_na_zakonczenie]>(0)))
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD CHECK  (([ID_nadzor_architektoniczny]>=(0)))
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD CHECK  (([Koszt]>=(0)))
GO
ALTER TABLE [dbo].[Nadzory_architektoniczne]  WITH CHECK ADD CHECK  (([Wielkosc]>(0)))
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [CK__Pracownic__ID_pr__37A5467C] CHECK  (([ID_pracownik]>=(0)))
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [CK__Pracownic__ID_pr__37A5467C]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [CK__Pracownic__Specj__38996AB5] CHECK  (([Specjalizacja]='OBIEKT_BIUROWY' OR [Specjalizacja]='OBIEKT_USLUGOWY' OR [Specjalizacja]='OBIEKT_MIESZKALNY'))
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [CK__Pracownic__Specj__38996AB5]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [CK__Pracownic__Upraw__398D8EEE] CHECK  (([Uprawnienia_do_nadzoru]='NIEUPRAWNIONY' OR [Uprawnienia_do_nadzoru]='UPRAWNIONY'))
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [CK__Pracownic__Upraw__398D8EEE]
GO
ALTER TABLE [dbo].[Pracownicy_zewnetrzni]  WITH CHECK ADD CHECK  (([ID_pracownik_zewnetrzny]>=(0)))
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD CHECK  (([Czas_oczekiwania_na_rozpoczecie]>(0)))
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD CHECK  (([Czas_oczekiwania_na_zakonczenie]>(0)))
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD CHECK  (([ID_projekt_architektoniczny]>=(0)))
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD CHECK  (([Ostateczna_cena]>=(0)))
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD CHECK  (([Wielkosc]>(0)))
GO
ALTER TABLE [dbo].[Projekty_architektoniczne]  WITH CHECK ADD CHECK  (([Cena]>=(0)))
GO
ALTER TABLE [dbo].[Szczegoly_nadzoru]  WITH CHECK ADD CHECK  (([ID_szczegoly_nadzoru]>=(0)))
GO
ALTER TABLE [dbo].[Szczegoly_projektu]  WITH CHECK ADD  CONSTRAINT [CK__Szczegoly__Czy_n__47DBAE45] CHECK  (([Czy_nadzorowano]='NIENADZOROWANO' OR [Czy_nadzorowano]='NADZOROWANO'))
GO
ALTER TABLE [dbo].[Szczegoly_projektu] CHECK CONSTRAINT [CK__Szczegoly__Czy_n__47DBAE45]
GO
ALTER TABLE [dbo].[Szczegoly_projektu]  WITH CHECK ADD  CONSTRAINT [CK__Szczegoly__ID_sz__45F365D3] CHECK  (([ID_szczegoly_projektu]>=(0)))
GO
ALTER TABLE [dbo].[Szczegoly_projektu] CHECK CONSTRAINT [CK__Szczegoly__ID_sz__45F365D3]
GO
ALTER TABLE [dbo].[Szczegoly_projektu]  WITH CHECK ADD  CONSTRAINT [CK__Szczegoly__Typ_p__46E78A0C] CHECK  (([Typ_projektu]='OBIEKT_BIUROWY' OR [Typ_projektu]='OBIEKT_USLUGOWY' OR [Typ_projektu]='OBIEKT_MIESZKALNY'))
GO
ALTER TABLE [dbo].[Szczegoly_projektu] CHECK CONSTRAINT [CK__Szczegoly__Typ_p__46E78A0C]
GO
USE [master]
GO
ALTER DATABASE [StudioArchitektoniczne] SET  READ_WRITE 
GO
