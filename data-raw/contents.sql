SELECT DISTINCT
    content.Id game_id,
    content.`Name` game_name,
    content.VersionName game_name_ver,
    content.ContentType game_type,
    content.Enabled game_status
FROM
    iquizoo_content_db.content
ORDER BY ContentType, `Name`, game_id;
