use mosskey;
Describe KeyCharacter;
SELECT CONCAT( REPEAT(' ', COUNT(parent.name) - 1), node.name) AS name
FROM KeyCharacter AS node,
        KeyCharacter AS parent
WHERE node.lft BETWEEN parent.lft AND parent.rht
GROUP BY node.name
ORDER BY node.lft;

SELECT * FROM KeyCharacter;