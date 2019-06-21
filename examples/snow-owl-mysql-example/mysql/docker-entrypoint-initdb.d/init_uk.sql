CREATE DATABASE snomedstore DEFAULT charset "utf8";
CREATE DATABASE lcsstore DEFAULT charset "utf8";
CREATE DATABASE opcsstore DEFAULT charset "utf8";
CREATE DATABASE icd10ukstore DEFAULT charset "utf8";
CREATE DATABASE mappingsetstore DEFAULT charset "utf8";
CREATE DATABASE valuesetstore DEFAULT charset "utf8";

GRANT ALL PRIVILEGES ON snomedstore.* to "snowowl"@"%";
GRANT ALL PRIVILEGES ON lcsstore.* to "snowowl"@"%";
GRANT ALL PRIVILEGES ON opcsstore.* to "snowowl"@"%";
GRANT ALL PRIVILEGES ON icd10ukstore.* to "snowowl"@"%";
GRANT ALL PRIVILEGES ON mappingsetstore.* to "snowowl"@"%";
GRANT ALL PRIVILEGES ON valuesetstore.* to "snowowl"@"%";

FLUSH PRIVILEGES;