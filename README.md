![drawSQL-image-export-2024-12-16](https://github.com/user-attachments/assets/46b66289-4a3f-409e-a35c-1c9fe23216a6)
https://drawsql.app/teams/hse-61/diagrams/vet

1.	Придумать свою предметную область и продумать схему БД для неё.
Это будет программа для сотрудников ветклиники, предназначенная для систематизации и работы с пациентами и их владельцами.
     
2.	Выделить функциональные требования к вашей БД и к приложению.
•	В базу данных входят два вида сотрудников ветеринарной клиники: ветеринары и сотрудники с ресепшена. Ветеринары могут вносить в БД информацию о том, какая процедура была сделана или какие лекарства были выданы на приеме. Сотрудник с ресепшена записывает информацию о пациентах и их владельцах, которые еще не посещали клинику, а также он ответственен за актуальную информацию о ветеринарах и приемах. Можно проследить отличия между пользователем-администратором и пользователем-ветеринаром в их доступном функционале. Пусть V - это ветеринар, а A - администратор:  
o	Создание базы данных (на случай первого запуска приложения пользователем) - A  
o	Удаление базы данных - A  
o	Вывод содержимого таблиц - A, V  
o	Очистка таблиц: частичная - V, полная - A  
o	Добавление новых данных - A, V  
o	Поиск по заранее выбранному (вами) текстовому не ключевому полю - A  
o	Обновление кортежа - A, V  
o	Удаление по заранее выбранному текстовому не ключевому полю - A  
o	Удаление конкретной записи, выбранной пользователем - A, V  
•	В стоимости процедур и лекарств будут встроены триггеры, чтобы ограничить доступ ветеринаров к изменениям этих атрибутов в сторону своей выгоды.  
•	Также, в БД будет существовать один индекс – дата и время приема – чтобы на ресепшене удобнее было прослеживать визиты клиентов.  
•	БД обладает 1НФ по причине отсутствия кортежей.  
•	БД обладает 2НФ, так как невозможно просмотреть по таблицам, что какой-то атрибут зависит не от первичного ключа. В нашем случае это мощные айдишники.  
•	БД обладает 3 НФ в силу отсутствия транзитивных зависимостей.
