-- SCRIPT ON WRITING LOOP QEURIES
-- syntax

--<<outer>>
--loop  
--  statements;
--
--<<inner>>
--  loop
--    inside statements;
--
--exit <<inner>>
--end loop;
--end loop;

-- PRINT NUMBERS FROM 1 TO 5
-- EXAMPLE 1
do $$
declare
  n integer:= 6;
  cnt integer := 1 ;  
begin
loop  
 exit when cnt = n ;
 raise notice '%', cnt;  
 cnt := cnt + 1 ;  
end loop;  
end; $$;


-- EXAMPLE 2
do $$
declare
 n integer:= 0;
 cnt integer := 10 ;  
begin
loop  
exit when cnt = n ;
raise notice '%', cnt;  
cnt := cnt - 1 ;  
end loop;  
end; $$;


-- EXAMPLE 3
do $$
declare
add integer := 0;
begin
while add <10 loop
raise notice 'Out addition count %', add;
add := add+1;
end loop;
end$$;

-- EXAMPLE 4
do $$
declare
add integer := 10;
begin
while add > 0 loop
raise notice 'Out addition count %',add;
add := add-1;
end loop;
end$$;

-- EXAMPLE 5
DO $$
DECLARE
  n INTEGER := 8;
  cnt INTEGER := 1;  
BEGIN
  LOOP  
    EXIT WHEN cnt = n;
    RAISE NOTICE '%', cnt;  
    cnt := cnt + 1;  
  END LOOP;  
END $$;

-- EXAMPLE 6
DO
$$
BEGIN
  RAISE NOTICE '%', 'Before block';
  <<normalblock>>  
  BEGIN
    RAISE NOTICE '%', 'Before exit; inside block';
    EXIT normalblock;
    RAISE NOTICE '%', 'After exit; inside block';
  END;
  RAISE NOTICE '%', 'End of block';
END;
$$;

-- EXAMPLE 7
do
$$
declare
  cnt int = 0;
begin
 loop
 -- increment of cnt
    cnt = cnt + 1;
 -- exit the loop if cnt > 10
 exit when cnt > 10;
 -- skip the iteration if cnt is an odd number
 continue when mod(cnt,2) = 1;
 -- print out the cnt
 raise notice '%', cnt;
 end loop;
end;
$$;
