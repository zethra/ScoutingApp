DROP PROCEDURE IF EXISTS mergeTags;
delimiter //
CREATE PROCEDURE mergeTags(
  IN tableName VARCHAR(20),
  IN oldTag VARCHAR(45),
  IN newTag VARCHAR(45)
)
BEGIN
	SET @cols = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'scoutingtags' AND table_name = 'matches') - 4;
    #SELECT @cols;
    SET @i = 0;
	WHILE @i < @cols DO
		#SELECT @i;
		SET @makeCol = CONCAT('UPDATE ',tableName , ' SET `tag', @i, '`=\'', newTag,'\' WHERE `tag', @i, '`=\'', oldTag, '\'');
		PREPARE stmt FROM @makeCol;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @i = @i + 1;
	END WHILE;
END //
delimiter ;
CALL mergeTags('matches', '2', 'c');