CREATE TABLE dish
(
    id BIGINT,
    name VARCHAR,
    description VARCHAR,
    menus_appeared BIGINT,
    times_appeared BIGINT,
    first_appeared BIGINT,
    last_appeared BIGINT,
    lowest_price DECIMAL(10, 3),
    highest_price DECIMAL(10, 3)
);

CREATE TABLE menu
(
    id INTEGER,
    name VARCHAR,
    sponsor VARCHAR,
    event VARCHAR,
    venue VARCHAR,
    place VARCHAR,
    physical_description VARCHAR,
    occasion VARCHAR,
    notes VARCHAR,
    call_number VARCHAR,
    keywords VARCHAR,
    language VARCHAR,
    date VARCHAR,
    location VARCHAR,
    location_type VARCHAR,
    currency VARCHAR,
    currency_symbol VARCHAR,
    status VARCHAR,
    page_count SMALLINT,
    dish_count SMALLINT
);

CREATE TABLE menu_page
(
    id BIGINT,
    menu_id BIGINT,
    page_number SMALLINT,
    image_id VARCHAR,
    full_height SMALLINT,
    full_width SMALLINT,
    uuid UUID
);

CREATE TABLE menu_item
(
    id BIGINT,
    menu_page_id BIGINT,
    price DECIMAL(10, 3),
    high_price DECIMAL(10, 3),
    dish_id BIGINT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    xpos FLOAT,
    ypos FLOAT
);

INSERT INTO dish SELECT * FROM read_csv('Dish.csv');
INSERT INTO menu SELECT * FROM read_csv('Menu.csv');
INSERT INTO menu_page SELECT * FROM read_csv('MenuPage.csv');
INSERT INTO menu_item SELECT * FROM read_csv('MenuItem.csv');


CREATE TABLE menu_item_denorm
AS SELECT
    price,
    high_price,
    created_at,
    updated_at,
    xpos,
    ypos,
    dish.id AS dish_id,
    dish.name AS dish_name,
    dish.description AS dish_description,
    dish.menus_appeared AS dish_menus_appeared,
    dish.times_appeared AS dish_times_appeared,
    dish.first_appeared AS dish_first_appeared,
    dish.last_appeared AS dish_last_appeared,
    dish.lowest_price AS dish_lowest_price,
    dish.highest_price AS dish_highest_price,
    menu.id AS menu_id,
    menu.name AS menu_name,
    menu.sponsor AS menu_sponsor,
    menu.event AS menu_event,
    menu.venue AS menu_venue,
    menu.place AS menu_place,
    menu.physical_description AS menu_physical_description,
    menu.occasion AS menu_occasion,
    menu.notes AS menu_notes,
    menu.call_number AS menu_call_number,
    menu.keywords AS menu_keywords,
    menu.language AS menu_language,
    menu.date AS menu_date,
    menu.location AS menu_location,
    menu.location_type AS menu_location_type,
    menu.currency AS menu_currency,
    menu.currency_symbol AS menu_currency_symbol,
    menu.status AS menu_status,
    menu.page_count AS menu_page_count,
    menu.dish_count AS menu_dish_count
FROM menu_item
    JOIN dish ON menu_item.dish_id = dish.id
    JOIN menu_page ON menu_item.menu_page_id = menu_page.id
    JOIN menu ON menu_page.menu_id = menu.id;
