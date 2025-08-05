-- Migration SQL Script at 2025-08-05T18:39:40.405Z

INSERT INTO category (id, label) VALUES ('58aebd56-a469-495a-9c7e-70bdf4b42893', 'burger');

INSERT INTO category (id, label) VALUES ('8430db5b-9ead-419e-b837-1d9e56b2134c', 'beef');

INSERT INTO category (id, label) VALUES ('37b2bed0-4e94-4bc4-bd41-76392d65b1fd', 'salad');

INSERT INTO category (id, label) VALUES ('83acaa36-1047-477d-be46-9e0a429dc5a9', 'chicken');

INSERT INTO category (id, label) VALUES ('b827521b-2342-4497-af09-035a0f57b34b', 'veggie');

INSERT INTO category (id, label) VALUES ('e8456f6b-76a6-49df-88e8-4f293237ffdd', 'wrap');

INSERT INTO category (id, label) VALUES ('9d9eb493-07b4-491e-aad4-a48a99047701', 'fries');

INSERT INTO category (id, label) VALUES ('f3dcab66-5f01-4b99-b392-bcf6a1534963', 'McCoffee');

INSERT INTO category (id, label) VALUES ('14443ef4-00fc-4ed3-9d62-a3dcb5e1713e', 'desert');

INSERT INTO category (id, label) VALUES ('52470733-05cc-429b-bd5b-02c7f8e2830e', 'egg');

INSERT INTO category (id, label) VALUES ('9fe75ada-ea24-404e-b5a4-67f1ffad9c37', 'nuggets');

INSERT INTO category (id, label) VALUES ('ef42d000-649a-42fa-a616-346a4cc4f438', 'pork');

INSERT INTO category (id, label) VALUES ('46c170d7-8b1b-4875-a3df-6b991301134c', 'fish');

INSERT INTO category (id, label) VALUES ('e9517c88-0ccc-4b5e-ae09-c285f3ab6006', 'drink');

INSERT INTO category (id, label) VALUES ('6a8abab2-1a14-4f2d-b080-143cc0df4565', 'ice cream');

INSERT INTO category (id, label) VALUES ('7092c214-d100-4b0c-b060-01b4a558ddb6', 'milk shake');

INSERT INTO category (id, label) VALUES ('6c76ec27-9ad4-4c24-ab34-41db006e85f9', 'fruit');

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '53ba5627-2969-4def-816e-cb649dea3446', '280™ Original', '280.webp', 772, 44, 3.4, 3.5, 41, 17, 55, 17, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '91130c33-3994-4b2e-9cf9-a0d61b49206d', 'Salade César', 'cesarSalad.webp', 402, 25, 1.7, 2.3, 21, 8, 27, 8.9, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'b6651106-e9c9-42ef-8906-76c371a3c3a3', 'Salade César Végétarienne', 'veggieCesarSalad.webp', 390, 15, 0.95, 2.8, 20, 9.1, 35, 2.8, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'e137f71a-6b00-4ffa-929c-34c5395776a7', 'Petite Salade', 'smallSalad.webp', 7, 0.7, 0.04, 0.8, 0, 0, 0.7, 0.3, 'A', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'ccac89db-5117-4f6a-a307-dfbbbbdbc3a1', 'P’tit Wrap Ranch', 'smallRanchWrap.webp', 319, 11, 1.3, 1.5, 16, 3.4, 32, 3.4, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '3feef76a-3103-4b66-9210-828022624114', 'Petite Frites', 'smallFries.webp', 231, 2.7, 0.38, 2.8, 11, 1, 29, 0.2, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'dfec6a11-c4e9-4ce4-b507-15965f528644', 'Donut Nature', 'sugarDonut.webp', 286, 4, 0.41, 0.7, 17, 7.8, 29, 9.8, 'E', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '7708b891-181b-43ad-8a76-c7f19e1fa0c8', 'McCrispy', 'crispy.webp', 530, 27, 2.4, 4, 22, 2.6, 54, 9.2, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '6ae621b3-a914-4783-9df8-e1d70e5a53ff', 'Big Arch', 'bigArch.webp', 1076, 59, 4.3, 4.2, 68, 24, 55, 15, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '59aa8a5a-7187-4096-9bc7-e0da8285ac0f', 'Double Cheese Bacon', 'doubleCheeseBacon.webp', 456, 28, 2.3, 2, 24, 11, 31, 8.2, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '64f8a17f-07d5-40e9-b4be-b181be492d02', 'Big Tasty™ - 2 Steaks Hachés', 'doubleBigTasty.webp', 940, 59, 2.8, 3, 58, 21, 44, 11, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '7e3614d7-6002-449e-b466-e20d1e0d6ab9', 'Big Tasty™ - 1 Steak Haché', 'bigTasty.webp', 690, 37, 2.4, 3, 40, 13, 44, 11, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'c769e16b-4e83-4f49-af35-95d2d213e3cb', 'Royal™ Bacon', 'royalBacon.webp', 490, 30, 2.2, 2.6, 24, 11, 38, 9.3, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'd0469638-ac1a-45b3-a935-4207a4e91975', 'Egg & Bacon McMuffin', 'eggBaconMuffin.webp', 277, 17, 1.2, 1.9, 11, 4.6, 27, 2.1, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'f8a86258-4ae7-440d-8172-4c8a4213dd2c', 'Double Cheeseburger', 'doubleCheese.webp', 442, 27, 2.2, 2.2, 23, 11, 31, 8, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'ba4d6850-8469-41f3-8144-36483078e3b8', 'Royal™ Deluxe', 'royalDeluxe.webp', 545, 29, 2, 2.7, 32, 11, 36, 7.3, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'd78e8566-b74d-496e-9f4a-d59f6ab56c23', 'Boîte de 20 Chicken McNuggets™', 'nug20.webp', 872, 51, 3.8, 2.8, 45, 5, 65, 1.4, 'C', 'x20'
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '4f43ea81-95b4-414c-ae97-f1800814040a', 'Boîte de 9 Chicken McNuggets™', 'nug9.webp', 392.4, 22.95, 1.71, 1.26, 20.25, 2.25, 29.25, 0.63, 'C', 'x9'
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'ac015b38-ff70-4992-94a2-647cf946e34d', 'Boîte de 6 Chicken McNuggets™', 'nug6.webp', 261.6, 15.3, 1.14, 0.84, 13.5, 1.5, 19.5, 0.42, 'C', 'x6'
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '39741ed4-6af6-41f9-93ff-afde40f7be24', 'Boîte de 4 Chicken McNuggets™', 'nug4.webp', 174.4, 10.2, 0.76, 0.56, 9, 1, 13, 0.28, 'C', 'x4'
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '89f9ee22-7762-4dfc-948b-c79c212449f2', 'Royal Cheese™', 'royalCheese.webp', 525, 31, 2.5, 2.6, 27, 12, 39, 10, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '0b20791f-13d9-4be5-8649-2d2be867ec57', 'CBO', 'cbo.webp', 659, 27, 2.8, 3.8, 35, 8.2, 57, 8.8, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '7c905f95-eae5-4e91-97cd-f7533d7ab032', 'Hamburger', 'hamburger.webp', 253, 2.1, 1.2, 2.1, 8.9, 3.5, 29, 6.6, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'acb99213-c19f-48aa-8030-ac01c5a3c336', 'McWrap™ New York & Poulet Bacon', 'newYorkWrap.webp', 552, 22, 2.8, 3.4, 26, 5.6, 56, 4.1, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '50a13af4-0e48-4c1b-bc40-31407109799e', 'Egg & Cheese McMuffin', 'eggCheese.webp', 263, 16, 1.1, 1.9, 10, 4.2, 27, 2.1, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '064395a1-f984-4c54-af17-7eb945522dda', 'Croque McDo', 'croque.webp', 255, 13, 1.6, 1.7, 9.7, 2.8, 28, 5.5, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '4c958c39-3959-43a5-ba7a-1c2cab75892c', 'P''tit Chicken', 'smallChicken.webp', 311, 12, 1.4, 3.1, 13, 1.6, 35, 5.3, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '707c225d-2539-41e2-89b1-6486ce4e2e25', 'Cheeseburger', 'cheeseburger.webp', 300, 16, 1.5, 2.1, 13, 5.6, 30, 7.4, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '3b251122-31f2-431b-81f9-9199862f34fa', 'McChicken', 'mcChicken.webp', 434, 19, 2, 3.3, 19, 2.2, 45, 6.3, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'f8ea094d-8749-4ad7-aa04-0b2ddf6e4d3f', 'McFish™ Mayo', 'mcFishMayo.webp', 295, 13, 1.2, 2.1, 11, 1.2, 35, 4.4, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '17d6310d-5826-42f5-b424-95b505e710ef', 'McWrap® Veggie', 'veggieWrap.webp', 495, 20, 2.9, 6.6, 22, 5.1, 51, 5.5, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '44d28252-b105-4f92-a691-dc1a2e6597b3', 'Filet-O-Fish', 'filetFish.webp', 329, 15, 1.4, 2.2, 14, 2.4, 36, 5.1, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '37f59ede-b5e7-48e3-b9e9-0c843c4c9512', 'Filet-O-Fish™ Deluxe', 'deluxeFiletFish.webp', 361, 16, 1.6, 2.5, 16, 3.7, 37, 5.9, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '54f122df-f52a-4a24-a1aa-bcb74d24a465', 'McFish', 'mcFish.webp', 284, 14, 1.4, 2.4, 7.9, 0.9, 38, 7.8, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'd09a29c6-3a78-46fa-a036-5b4e715d7edc', 'McVeggie', 'mcVeggie.webp', 409, 17, 2.3, 6.5, 16, 1.9, 46, 7.4, 'A', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '7a2c0d14-a50c-4ac9-88a0-a2d039c20e52', 'Big Mac', 'bigMac.webp', 530, 27, 2.3, 3.8, 27, 9.6, 42, 7.8, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'ddb2a4cd-dc89-4a8d-ae88-c5a5e0e28ed3', 'Maple BBQ Quarter Pounder', 'maple.webp', 600, 33, 2.5, 2.6, 35, 14, 37, 8.5, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '56c4d566-a586-4d88-9149-d82721df9fcd', 'Double Maple BBQ Quarter Pounder', 'doubleMaple.webp', 825, 53, 3, 3, 51, 22, 37, 8.9, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '1e49257a-e0be-489d-a2f4-c68dd9df6094', 'Steakhouse', 'steakhouse.webp', 881, 52, 2.6, 2.9, 55, 20, 43, 8.5, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'fa4866b1-16b9-4f48-b1f7-d18f17968692', 'Teriyaki Chicken', 'teriyakiChicken.webp', 468, 20, 2.8, 3.4, 17, 2.1, 57, 14, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '0e338e1b-2b52-4b95-b795-c39ce1948a95', 'Shrimp Filet', 'shrimpFilet.webp', 443, 17, 2.2, 3.1, 17, 1.5, 54, 10, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'c5829a1f-b7a8-48ee-ae4f-ed3856e4ca96', 'Nectar De Pomme Bio', 'appleJuice.webp', 56, 0.2, 0.02, 0.2, 0.3, 0, 13, 12, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'f2ae0928-cd13-4ff5-ad9c-f122ec2d016a', 'Hawaï® Saveur Tropical', 'hawai.webp', 178, 0, 0, 0, 0, 0, 44, 44, 'E', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'cb129c82-e840-4468-aa67-d63175cae49c', 'Capri-Sun® Tropical', 'capriSun.webp', 43, 0, 0.01, 0, 0, 0, 10, 10, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'e16496bd-9f15-4f79-8607-119549216f39', 'McFlurry™ Mangue Bobba', 'macFlurryMango.webp', 259, 5.4, 0.21, 0.5, 5.4, 3.6, 47, 42, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '08400a26-7f33-4699-8d2f-0be7e66f3773', 'McFloat® Sakura', 'mcFloatSakura.webp', 98, 2.6, 0.23, 0, 2.6, 1.8, 16, 14, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'dc15317b-2ac4-4e24-8b1f-eaa7f10abfd0', 'Sundae coulis mangue', 'sundaeMango.webp', 221, 5.9, 0.15, 1.1, 7.5, 3.2, 32, 28, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'c24095f4-961b-4b24-8d3a-5584a9b65f34', 'P''tit Glacé Saveur Vanille', 'smallVanillaIceCream.webp', 68, 1.8, 0.07, 0, 1.8, 1.2, 11, 10, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '380f6745-0fe0-4eaf-9a83-5588d7496522', 'P''tit Milkshake Saveur Vanille', 'smallVanillaShake.webp', 257, 5.5, 0.22, 0, 5.7, 3.9, 46, 42, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'c0e23867-27fc-43ca-968c-3f9676ce9003', 'Grand Milkshake Saveur Vanille', 'bigVanillaShake.webp', 315, 8.7, 0.3, 0, 6.2, 4.2, 56, 51, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'da0ff302-9306-43d7-ac10-55060f100aaa', 'P''tite Pomme', 'appleSlices.webp', 42, 0.2, 0, 1.6, 0.2, 0, 9, 9, 'A', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '6a147054-4762-45e7-b120-eea8b8e0ea49', 'Grand Milkshake Saveur Fraise', 'bigStrawberryShake.webp', 315, 8.8, 0.31, 0, 6.2, 4.2, 56, 48, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '920df84a-1fc0-455d-9307-54215e9a1f9f', 'P''tit Milkshake Saveur Fraise', 'smallStrawberryShake.webp', 254, 5.6, 0.22, 0, 5.7, 3.9, 45, 39, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '8b13175d-5432-4688-8392-3519f4c24bed', 'Berlingo'' Fruits', 'applesauce.webp', 46, 0.5, 0, 1.2, 0.5, 0.1, 11, 11, 'A', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'e37d55c4-3604-4bbb-b249-37110d23c232', 'Muffin Saveur Chocolat Noisette', 'chocolateMuffin.webp', 595, 8.1, 1.1, 3.8, 33, 5.7, 64, 42, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '777ea48c-66d3-4444-8bc9-a907de8f542c', 'P''tits Concombres', 'cucumbers.webp', 10, 0.4, 0, 0.3, 0.3, 0.1, 1.9, 1, 'A', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '83018559-2dc6-4479-b963-8e3d08653f4b', 'P''tit Ananas', 'ananas.webp', 38, 0.5, 0, 1.5, 0.2, 0, 7.8, 7.8, 'A', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'e80e08f2-a05f-478f-aee9-80e20b0a7bbf', 'Cookie Fourré Choconuts', 'chocolateCookie.webp', 380, 5, 0.42, 2.6, 18, 4.7, 50, 30, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'd3379f59-be6f-41ef-a2ee-1b724bb03fba', 'Duo De Macarons', 'macaroonsDuo.webp', 171, 1, 0.04, 1.2, 7.2, 0.7, 24, 22, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '56527274-7938-44d3-a7d4-9f7ef1badbe5', 'McChocoNuts Nappage Choconuts', 'mcChocoNuts.webp', 397, 11, 0.77, 3.3, 16, 7.8, 50, 22, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '42729a3c-635d-4235-b9df-b0e8c41eba17', 'Brownie Chocolat-Noisettes', 'brownie.webp', 394, 4.8, 0.31, 3.5, 24, 11, 37, 21, 'D', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '991861ab-11f1-4be5-8b25-d167093e1cf3', 'Moyenne Portion de Deluxe Potatoes', 'mediumPotatoes.webp', 227, 2.8, 0.72, 3.3, 12, 1.1, 26, 0, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '167f19d3-d6e1-4f1d-9ffa-e7b38dcc9664', 'Grande Portion de Deluxe Potatoes', 'bigPotatoes.webp', 330, 4, 1, 4.8, 17, 1.6, 37, 0, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '09c7f579-b51d-43b3-8cf6-5e52c909b1cf', 'Potatoes Double Cheddar Fondu', 'cheesePotatoes.webp', 467, 11, 2.8, 5.6, 24, 6.7, 49, 0.6, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '952676c7-ef25-4011-91ee-8daf902aef2c', 'Potatoes Cheddar Fondu - Bacon', 'baconPotatoes.webp', 467, 11, 2.4, 5.6, 24, 5.7, 49, 0.6, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '59932e13-6bfb-4c1c-b598-6c11e7bb9e05', 'Muffin Aux Myrtilles', 'blueberryMuffin.webp', 480, 6.1, 1.1, 1, 22, 11, 63, 35, 'E', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'c8c4f276-0d19-49a0-99ef-778e1dae586a', 'Donut Saveur Chocolat', 'chocolateDonut.webp', 363, 3.9, 0.62, 1.2, 24, 11, 32, 15, 'E', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'e538279d-08f0-4f1b-a4ec-ba94df2c196a', 'Frites à la Québécoise', 'quebecFries.webp', 603, 12, 1.8, 5.9, 31, 7.3, 66, 3, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    'e121e5ac-5707-4294-8380-48d05073a2bc', 'Moyenne Portion de Frites', 'mediumFries.webp', 328, 3.9, 0.53, 4, 16, 1.5, 41, 0.3, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '222b7444-1442-4946-a0f7-2c136ed1328d', 'Grande Portion de Frites', 'bigFries.webp', 434, 5.1, 0.71, 5.3, 21, 2, 54, 0.5, 'B', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '36a0006a-077b-49e6-8982-ba02415dc280', 'McFlavor® Fries Double Cheddar Fondu', 'chedarFries.webp', 0, 0, 0, 0, 0, 0, 0, 0, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '71c8c244-5def-4479-b5ee-5a6a1b603a4f', 'McFlavor® Fries Cheddar Fondu - Bacon', 'baconFries.webp', 0, 0, 0, 0, 0, 0, 0, 0, 'C', NULL
  );

INSERT INTO product (
    id, name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score, item_label
  ) VALUES (
    '5fe9b453-2f10-41db-9f59-1bc1224e69f8', 'Le Bio à Boire', 'bioABoire.webp', 59, 2.6, 0, 0, 1.5, 1, 8.6, 8.5, 'B', NULL
  );

INSERT INTO belong_in_category (product_id, category_id) VALUES ('53ba5627-2969-4def-816e-cb649dea3446', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('53ba5627-2969-4def-816e-cb649dea3446', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('91130c33-3994-4b2e-9cf9-a0d61b49206d', '37b2bed0-4e94-4bc4-bd41-76392d65b1fd');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('91130c33-3994-4b2e-9cf9-a0d61b49206d', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('b6651106-e9c9-42ef-8906-76c371a3c3a3', '37b2bed0-4e94-4bc4-bd41-76392d65b1fd');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('b6651106-e9c9-42ef-8906-76c371a3c3a3', 'b827521b-2342-4497-af09-035a0f57b34b');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e137f71a-6b00-4ffa-929c-34c5395776a7', '37b2bed0-4e94-4bc4-bd41-76392d65b1fd');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e137f71a-6b00-4ffa-929c-34c5395776a7', 'b827521b-2342-4497-af09-035a0f57b34b');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ccac89db-5117-4f6a-a307-dfbbbbdbc3a1', 'e8456f6b-76a6-49df-88e8-4f293237ffdd');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ccac89db-5117-4f6a-a307-dfbbbbdbc3a1', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('3feef76a-3103-4b66-9210-828022624114', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('dfec6a11-c4e9-4ce4-b507-15965f528644', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('dfec6a11-c4e9-4ce4-b507-15965f528644', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7708b891-181b-43ad-8a76-c7f19e1fa0c8', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7708b891-181b-43ad-8a76-c7f19e1fa0c8', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('6ae621b3-a914-4783-9df8-e1d70e5a53ff', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('6ae621b3-a914-4783-9df8-e1d70e5a53ff', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('59aa8a5a-7187-4096-9bc7-e0da8285ac0f', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('59aa8a5a-7187-4096-9bc7-e0da8285ac0f', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('64f8a17f-07d5-40e9-b4be-b181be492d02', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('64f8a17f-07d5-40e9-b4be-b181be492d02', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7e3614d7-6002-449e-b466-e20d1e0d6ab9', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7e3614d7-6002-449e-b466-e20d1e0d6ab9', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c769e16b-4e83-4f49-af35-95d2d213e3cb', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c769e16b-4e83-4f49-af35-95d2d213e3cb', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d0469638-ac1a-45b3-a935-4207a4e91975', '52470733-05cc-429b-bd5b-02c7f8e2830e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('f8a86258-4ae7-440d-8172-4c8a4213dd2c', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('f8a86258-4ae7-440d-8172-4c8a4213dd2c', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ba4d6850-8469-41f3-8144-36483078e3b8', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ba4d6850-8469-41f3-8144-36483078e3b8', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d78e8566-b74d-496e-9f4a-d59f6ab56c23', '9fe75ada-ea24-404e-b5a4-67f1ffad9c37');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d78e8566-b74d-496e-9f4a-d59f6ab56c23', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('4f43ea81-95b4-414c-ae97-f1800814040a', '9fe75ada-ea24-404e-b5a4-67f1ffad9c37');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('4f43ea81-95b4-414c-ae97-f1800814040a', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ac015b38-ff70-4992-94a2-647cf946e34d', '9fe75ada-ea24-404e-b5a4-67f1ffad9c37');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ac015b38-ff70-4992-94a2-647cf946e34d', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('39741ed4-6af6-41f9-93ff-afde40f7be24', '9fe75ada-ea24-404e-b5a4-67f1ffad9c37');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('39741ed4-6af6-41f9-93ff-afde40f7be24', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('89f9ee22-7762-4dfc-948b-c79c212449f2', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('89f9ee22-7762-4dfc-948b-c79c212449f2', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('0b20791f-13d9-4be5-8649-2d2be867ec57', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('0b20791f-13d9-4be5-8649-2d2be867ec57', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7c905f95-eae5-4e91-97cd-f7533d7ab032', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7c905f95-eae5-4e91-97cd-f7533d7ab032', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('acb99213-c19f-48aa-8030-ac01c5a3c336', 'e8456f6b-76a6-49df-88e8-4f293237ffdd');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('acb99213-c19f-48aa-8030-ac01c5a3c336', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('50a13af4-0e48-4c1b-bc40-31407109799e', '52470733-05cc-429b-bd5b-02c7f8e2830e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('064395a1-f984-4c54-af17-7eb945522dda', 'ef42d000-649a-42fa-a616-346a4cc4f438');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('064395a1-f984-4c54-af17-7eb945522dda', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('4c958c39-3959-43a5-ba7a-1c2cab75892c', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('4c958c39-3959-43a5-ba7a-1c2cab75892c', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('707c225d-2539-41e2-89b1-6486ce4e2e25', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('707c225d-2539-41e2-89b1-6486ce4e2e25', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('3b251122-31f2-431b-81f9-9199862f34fa', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('3b251122-31f2-431b-81f9-9199862f34fa', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('f8ea094d-8749-4ad7-aa04-0b2ddf6e4d3f', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('f8ea094d-8749-4ad7-aa04-0b2ddf6e4d3f', '46c170d7-8b1b-4875-a3df-6b991301134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('17d6310d-5826-42f5-b424-95b505e710ef', 'e8456f6b-76a6-49df-88e8-4f293237ffdd');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('17d6310d-5826-42f5-b424-95b505e710ef', 'b827521b-2342-4497-af09-035a0f57b34b');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('44d28252-b105-4f92-a691-dc1a2e6597b3', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('44d28252-b105-4f92-a691-dc1a2e6597b3', '46c170d7-8b1b-4875-a3df-6b991301134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('37f59ede-b5e7-48e3-b9e9-0c843c4c9512', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('37f59ede-b5e7-48e3-b9e9-0c843c4c9512', '46c170d7-8b1b-4875-a3df-6b991301134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('54f122df-f52a-4a24-a1aa-bcb74d24a465', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('54f122df-f52a-4a24-a1aa-bcb74d24a465', '46c170d7-8b1b-4875-a3df-6b991301134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d09a29c6-3a78-46fa-a036-5b4e715d7edc', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d09a29c6-3a78-46fa-a036-5b4e715d7edc', 'b827521b-2342-4497-af09-035a0f57b34b');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7a2c0d14-a50c-4ac9-88a0-a2d039c20e52', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('7a2c0d14-a50c-4ac9-88a0-a2d039c20e52', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ddb2a4cd-dc89-4a8d-ae88-c5a5e0e28ed3', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('ddb2a4cd-dc89-4a8d-ae88-c5a5e0e28ed3', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('56c4d566-a586-4d88-9149-d82721df9fcd', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('56c4d566-a586-4d88-9149-d82721df9fcd', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('1e49257a-e0be-489d-a2f4-c68dd9df6094', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('1e49257a-e0be-489d-a2f4-c68dd9df6094', '8430db5b-9ead-419e-b837-1d9e56b2134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('fa4866b1-16b9-4f48-b1f7-d18f17968692', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('fa4866b1-16b9-4f48-b1f7-d18f17968692', '83acaa36-1047-477d-be46-9e0a429dc5a9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('0e338e1b-2b52-4b95-b795-c39ce1948a95', '58aebd56-a469-495a-9c7e-70bdf4b42893');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('0e338e1b-2b52-4b95-b795-c39ce1948a95', '46c170d7-8b1b-4875-a3df-6b991301134c');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c5829a1f-b7a8-48ee-ae4f-ed3856e4ca96', 'e9517c88-0ccc-4b5e-ae09-c285f3ab6006');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('f2ae0928-cd13-4ff5-ad9c-f122ec2d016a', 'e9517c88-0ccc-4b5e-ae09-c285f3ab6006');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('cb129c82-e840-4468-aa67-d63175cae49c', 'e9517c88-0ccc-4b5e-ae09-c285f3ab6006');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e16496bd-9f15-4f79-8607-119549216f39', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('08400a26-7f33-4699-8d2f-0be7e66f3773', 'e9517c88-0ccc-4b5e-ae09-c285f3ab6006');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('dc15317b-2ac4-4e24-8b1f-eaa7f10abfd0', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c24095f4-961b-4b24-8d3a-5584a9b65f34', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('380f6745-0fe0-4eaf-9a83-5588d7496522', '7092c214-d100-4b0c-b060-01b4a558ddb6');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('380f6745-0fe0-4eaf-9a83-5588d7496522', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c0e23867-27fc-43ca-968c-3f9676ce9003', '7092c214-d100-4b0c-b060-01b4a558ddb6');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c0e23867-27fc-43ca-968c-3f9676ce9003', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('da0ff302-9306-43d7-ac10-55060f100aaa', '6c76ec27-9ad4-4c24-ab34-41db006e85f9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('da0ff302-9306-43d7-ac10-55060f100aaa', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('6a147054-4762-45e7-b120-eea8b8e0ea49', '7092c214-d100-4b0c-b060-01b4a558ddb6');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('6a147054-4762-45e7-b120-eea8b8e0ea49', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('920df84a-1fc0-455d-9307-54215e9a1f9f', '7092c214-d100-4b0c-b060-01b4a558ddb6');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('920df84a-1fc0-455d-9307-54215e9a1f9f', '6a8abab2-1a14-4f2d-b080-143cc0df4565');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('8b13175d-5432-4688-8392-3519f4c24bed', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('8b13175d-5432-4688-8392-3519f4c24bed', '6c76ec27-9ad4-4c24-ab34-41db006e85f9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e37d55c4-3604-4bbb-b249-37110d23c232', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e37d55c4-3604-4bbb-b249-37110d23c232', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('777ea48c-66d3-4444-8bc9-a907de8f542c', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('777ea48c-66d3-4444-8bc9-a907de8f542c', '6c76ec27-9ad4-4c24-ab34-41db006e85f9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('83018559-2dc6-4479-b963-8e3d08653f4b', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('83018559-2dc6-4479-b963-8e3d08653f4b', '6c76ec27-9ad4-4c24-ab34-41db006e85f9');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e80e08f2-a05f-478f-aee9-80e20b0a7bbf', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e80e08f2-a05f-478f-aee9-80e20b0a7bbf', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d3379f59-be6f-41ef-a2ee-1b724bb03fba', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('d3379f59-be6f-41ef-a2ee-1b724bb03fba', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('56527274-7938-44d3-a7d4-9f7ef1badbe5', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('56527274-7938-44d3-a7d4-9f7ef1badbe5', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('42729a3c-635d-4235-b9df-b0e8c41eba17', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('42729a3c-635d-4235-b9df-b0e8c41eba17', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('991861ab-11f1-4be5-8b25-d167093e1cf3', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('167f19d3-d6e1-4f1d-9ffa-e7b38dcc9664', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('09c7f579-b51d-43b3-8cf6-5e52c909b1cf', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('952676c7-ef25-4011-91ee-8daf902aef2c', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('59932e13-6bfb-4c1c-b598-6c11e7bb9e05', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('59932e13-6bfb-4c1c-b598-6c11e7bb9e05', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c8c4f276-0d19-49a0-99ef-778e1dae586a', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('c8c4f276-0d19-49a0-99ef-778e1dae586a', 'f3dcab66-5f01-4b99-b392-bcf6a1534963');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e538279d-08f0-4f1b-a4ec-ba94df2c196a', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('e121e5ac-5707-4294-8380-48d05073a2bc', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('222b7444-1442-4946-a0f7-2c136ed1328d', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('36a0006a-077b-49e6-8982-ba02415dc280', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('71c8c244-5def-4479-b5ee-5a6a1b603a4f', '9d9eb493-07b4-491e-aad4-a48a99047701');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('5fe9b453-2f10-41db-9f59-1bc1224e69f8', '14443ef4-00fc-4ed3-9d62-a3dcb5e1713e');

INSERT INTO belong_in_category (product_id, category_id) VALUES ('5fe9b453-2f10-41db-9f59-1bc1224e69f8', 'e9517c88-0ccc-4b5e-ae09-c285f3ab6006');

INSERT INTO product_group (id, label) VALUES ('79a7298f-5f5d-4142-9e6c-446c0db0a44e', 'nuggets');

INSERT INTO belong_to_group (product_id, group_id) VALUES ('d78e8566-b74d-496e-9f4a-d59f6ab56c23', '79a7298f-5f5d-4142-9e6c-446c0db0a44e');

INSERT INTO belong_to_group (product_id, group_id) VALUES ('4f43ea81-95b4-414c-ae97-f1800814040a', '79a7298f-5f5d-4142-9e6c-446c0db0a44e');

INSERT INTO belong_to_group (product_id, group_id) VALUES ('ac015b38-ff70-4992-94a2-647cf946e34d', '79a7298f-5f5d-4142-9e6c-446c0db0a44e');

INSERT INTO belong_to_group (product_id, group_id) VALUES ('39741ed4-6af6-41f9-93ff-afde40f7be24', '79a7298f-5f5d-4142-9e6c-446c0db0a44e');