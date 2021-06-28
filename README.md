# Изучаем фреймворк Firebase

    - Firebase авторизация
    - Firebase firestore (база данных юзер с доп. полями)
    - Firebase storage (для хранения медиа файлов)
    - Разложил все по коллекциям и документам
    
- Окно авторизации/регистрации.
- Проверка Auth.auth().addStateDidChangeListener.
    не автоизированны? тогда выскочит окно ))).
- Познакомился с ImagePicker (доступ к библиотеке фотографий).
- Выбор фотки и последующая загрузка в профайл.
- Загрузка фотографии и кеширование.
- BlurView наконецто. (дизайн не для примера).
- Динамический задний фон.
<img src="https://github.com/ihValery/FirebaseProfile/blob/feature/FireStoreCollectionUsers.png"></a>
- Таблица со счетом к основному проекту
- Выбрали простенький дизайн с нестандартными фигурами
- Повторил path (рисование фигур)
- 
- Осталось реализовать связь с сервером )) (аккуратное расположение в базе)
    - Сортировка .whereField("uid", isEqualTo: userId)
    - Добавление полей .setData(["userName" : name])
    - Добавление документа .addDocument(data: ["userName" : name]) (ведет к нагромождению)

<img src="https://github.com/ihValery/FirebaseProfile/blob/feature/ScoreTable.png"></a>
<img src="https://github.com/ihValery/FirebaseProfile/blob/feature/profileFB.gif?raw=true"></a>
