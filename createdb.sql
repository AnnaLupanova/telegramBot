create table budget(
    codename varchar(255) primary key,
    daily_limit integer
);

create table category(
    codename varchar(255) primary key,
    name varchar(255),
    is_base_expense boolean,
    aliases text
);
create table user_table(
    user_id varchar(255) primary key,
    name varchar(255)
);


create table expense(
    id integer primary key,
    amount integer,
    created datetime,
    category_codename integer,
    raw_text text,
    user_id integer,
    FOREIGN KEY(user_id) REFERENCES user_table(user_id),
    FOREIGN KEY(category_codename) REFERENCES category(codename)
);


insert into category (codename, name, is_base_expense, aliases)
values
    ("products", "продукты", true, "еда, магазин"),
    ("coffee", "кофе", false, ""),
    ("cafe", "кафе", false, "ресторан, рест, мак, макдональдс, макдак, kfc, ilpatio, il patio, бк, "),
    ("transport", "транспорт", true, "метро, автобус, metro, тралик, троллейбус, общ. транспорт"),
    ("taxi", "такси", true, "яндекс такси, yandex taxi"),
    ("phone", "телефон", true, "мобильный телефон, связь"),
    ("fuel", "топливо", true, "дизель, бенз, бензин, заправка"),
    ("car", "ремонт машины", true, "тачка, ремонт машины, запчасти"),
    ("animals", "собакa", true, "корм, прививки"),
    ("repair", "ремонт квартиры", true, "обои, шторы, карниз"),
    ("apartment", "коммунилка", true, "коммунилка, вода, свет, за квартиру, ЖКХ, жкх"),
    ("internet", "интернет", true, "инет, inet"),
    ("subscriptions", "подписки", false, "подписка"),
    ("other", "прочее", true, "");

insert into budget(codename, daily_limit) values ('base', 600);
insert into user_table (user_id,name) values ("701722851","Aня"), ("781728721", "Толя");
