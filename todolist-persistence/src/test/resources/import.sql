-- CategoryDaoTest
-- testFindCategory
-- ID = 1L
INSERT INTO category(name) VALUES('testFindCategoryNameDB');
-- testUpdateCategoryHasNameChanged
-- ID = 2L
INSERT INTO category(name) VALUES('testUpdateCategoryChangedNameDB');
-- testUpdateCategoryHasRightName
-- ID = 3L
INSERT INTO category(name) VALUES('testUpdateCategoryRightNameDB');

-- TaskDaoTest
-- testFindableByLabel
-- ID_TASK = 1L
INSERT INTO task(label) VALUES('testFindableLabelDB');
-- testListTasksForGivenUserAndCategory
-- ID_USER = 1L
INSERT INTO users(name, USER_TYPE) VALUES('testUserDB', 'USER_FREE');
-- ID_CATEGORY = 4L
INSERT INTO category(name) VALUES('testCategoryDB');
-- ID_TASK = 2L
INSERT INTO task(label, id_user, id_category) VALUES('testListByUserAndCategoryDB', 1, 4);
INSERT INTO task(label, beginningDate, endingDate, id_user, id_category) VALUES('Tache de test', '2016-10-18', '2017-01-19', 1, 1);
INSERT INTO task(label, beginningDate, endingDate, id_user, id_category) VALUES('Tache coucou', '2016-11-02', '2017-01-14', 1, 1);
INSERT INTO task(label, beginningDate, endingDate, id_user, id_category) VALUES('Tache encore de test', '2016-10-18', '2017-01-20', 1, 1);
INSERT INTO task(label, beginningDate, endingDate, id_user, id_category) VALUES('Tache terminée', '2016-11-02', '2016-11-03', 1, 1);