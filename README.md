# Aplikacja Biblioteczna - aplikacja zaliczeniowa na Projektu Zespołowego
*Wykonali **Rafał Kowalczyk** i **Jan Mrowiec***

## Opis programu

Program służy do zarządzania siecią bibliotek dla jej pracowników, jak i korzystanie z niej dla zwykłych użytkowników.
Utworzony został do tego system logowania z różnymi typami kont

Opragramowanie rozróżnia trzy typy kont
- **Admin**
- **Bibliotekarz**
- **Czytelnik** 
---
## Funkcjanlność dla każdego konta
### Czytelnik

- Przeglądanie kolekcji książek
- Dodawanie książek do listy życzeń
- Wypożyczanie książek
- Przeglądanie hisorii swoich wypożyczeń
- Zarządzanie swoim kontem (zmień email, username, password)
- Usunięcie konta
---
### Bibliotekarz
*Każdy bibliotekarz jest przypisany do jednej biblioteki*
- Przeglądanie kolekcji książek
- Dodawanie kolejnych książek do swojej biblioteki
- Edycja danych o książkach
- Przedłużanie lub zakończenie wypożyczenia
- Zarządzanie swoim kontem (zmień email, username, password)
- Usunięcie konta
---
### Admin
- Wszystkie funkcjonalności czytelnika i bibliotekarza
- Dodawanie i edycja bibliotek
- Zmiana typu kont
---

## Technologie
### Front-end: Flutter/Dart
Aplikacja została napisana wykorzystując **Fluttera** w wersji 3.7.5 wraz z językiem **Dart** w wersji 2.19.2. Apliakcja jest głównie przeznaczona na smartphony z system operacyjnym Android, ale była również testowana w wersji Webowej

---
### Back-end: Firabase
Do zarządzania autoryzacją oraz persystencją aplikacja wykorzystuje zestaw narzędzi firebase w tym **Cloud Firestore** i **Authentication**

---
### Baza danych: Cloud Firestore
Aplikaja wykorzystuje baze danych No-SQL wy oparciu o kolekcje i dokumenty. Apliakacja wykorzystuje strumenia firebase - zmiana danych w bazie automatycznie wysyła powiadomienie do klienta o zmianie stanu rekordu.

# Autorzy
  - Rafał Kowalczyk
  - Jan Mrowiec


*Uniewersytet Jagielloński 2023*
