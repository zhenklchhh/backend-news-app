# Описание проекта
Данный проект направлен на разработку информационно-социального приложения, позволяющего пользователям получать актуальную информацию из различных источников, формируя свою собственную ленту новостей. Приложение призвано решить проблему однобокости взгляда на новости, предоставляя доступ к информации с точки зрения разных авторов и сообществ.

### Цели
- Развитие навыков участников проекта в области разработки программного обеспечения, включая проектирование, дизайн, программирование, работу с базами данных, сетевое взаимодействие и командную работу.
- Создание удобного и функционального мобильного приложения для просмотра и агрегации новостей из различных источников, с возможностью персонализации ленты и взаимодействия с сообществами.

### Функционал
- Регистрация и авторизация пользователей
- Просмотр новостей из различных источников
- Создание и управление сообществами
- Публикация новостей в сообществах
- Формирование персональной ленты новостей на основе интересов и подписок
- Система тегирования новостей

# Стек используемых технологий
- Trello
- Java
- Figma
- PostgreSQL
- Android Studio
- Flutter

# Роли пользователей и описание их действий в системе (USecases.drawio - диаграмма вариантов использования)
Существуют сообщества, которыми полностью управляют их создатели (владельцы), есть авторы - пользователи которые могут публиковать и редактировать свои статьи, есть также модераторы сообществ, которые могут взаимодействовать (редактировать, удалять и т.д) со статьями своего сообщества, создатель сообщества же занимается назначением ролей в сообществе (и также может выдать себе роли). Есть также обычные пользователи которые могут просматривать новости и оставлять реакцию на них. Есть администраторы приложения, которые, в свою очередь, имеют доступ ко всем сообществам, новостям и т.д, и могут выполнять с ними любые доступные действия

# ER-диаграмма базы данных - файл ProjectERDiagram.png(в репозитории)
# API
### Сущности (сущности, поля и типы полей указаны в ER-диаграмме)
### API Endpoints
* #### Сообщества (communities):
  * GET /communities: Получить список всех сообществ. Ответ: JSON с массивом сообществ и информацией о пагинации. Параметры запроса: page (Номер страницы (по умолчанию 1)), limit (Количество элементов на странице (по умолчанию 10)), search (Поиск по названию или описанию).
  * GET /communities/{id}: Получить информацию о сообществе по ID. Ответ: JSON с данными сообщества
  * POST /communities: Создать новое сообщество (требуется авторизация как владелец). Тело запроса: JSON с данными сообщества. Ответ: JSON с данными созданного сообщества
  * PUT /communities/{id}: Обновить информацию о сообществе (требуется авторизация как владелец). Тело запроса: JSON с данными сообщества. Ответ: JSON с данными обновленного сообщества
  * DELETE /communities/{id}: Удалить сообщество (требуется авторизация как владелец). Ответ: Статус код 204 (No Content).
* #### Новости (news):
  * GET /news: Получить список новостей. Параметры запроса: page (Номер страницы (по умолчанию 1)), limit(Количество элементов на странице (по умолчанию 10)), community_id(Фильтр по ID сообщества), tag_id( Фильтр по ID тега), search(Поиск по заголовку или содержанию).Ответ: JSON с массивом новостей и информацией о пагинации
  * GET /news/{id}: Получить информацию о новости по ID. Ответ: JSON с данными новости.
  * POST /communities/{community_id}/news: Создать новость в сообществе (требуется авторизация как автор, владелец или модератор). Тело запроса: JSON с данными новости. Ответ: JSON с данными созданной новости.
  * PUT /news/{id}: Обновить информацию о новости (требуется авторизация как автор, владелец или модератор). Тело запроса: JSON с данными новости. Ответ: JSON с обновленными данными новости.
  * DELETE /news/{id}: Удалить новость (требуется авторизация как автор, владелец, модератор или администратор). Ответ: Статус код 204 (No Content).
* #### Теги (tags):
  * GET /tags: Получить список всех тегов. Ответ: JSON с массивом тегов.
  * GET /tags/{id}: Получить информацию о теге по ID. Ответ: JSON с данными тега.
  * POST /tags: Создать новый тег (требуется авторизация как администратор). Тело запроса: JSON с названием тега. Ответ: JSON с данными созданного тега.
  * PUT /tags/{id}: Обновить информацию о теге (требуется авторизация как администратор). Тело запроса: JSON с названием тега. Ответ: JSON с обновленными данными тега.
  * DELETE /tags/{id}: Удалить тег (требуется авторизация как администратор). Ответ: Статус код 204 (No Content).
* #### Пользователи (users):
  * POST /users/register: Регистрация пользователя. Тело запроса: JSON с данными пользователя. Ответ: JSON с данными созданного пользователя
  * GET /users: Получение списка пользователей.
  * GET /users/{id}: Получение конкретного пользователя.
  * POST /users/login: Авторизация пользователя. Тело запроса: JSON с email и паролем. Ответ: JSON с токеном доступа.

# Роли и права
* Администратор: Полный доступ ко всем функциям API.
* Владелец сообщества: Полный доступ к управлению своим сообществом, включая назначение модераторов и авторов.
* Модератор сообщества: Может создавать, редактировать и удалять новости в сообществе, а также банить пользователей.
* Автор сообщества: Может создавать и редактировать свои новости в сообществе.
* Пользователь: Может просматривать новости
