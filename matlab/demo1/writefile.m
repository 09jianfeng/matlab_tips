fid = fopen('test.txt', 'w' ); % open for overwriting
a = 5;
fprintf(fid, 'The value of the variable a is %d', a);
fprintf(fid, '\n\tBye Bye!!'); % put a newline (\n) and tab (\t) before Bye Bye
fclose(fid);



file_id = fopen('test.txt', 'a' ); % open for appending
b = 22.233;
fprintf(file_id, 'The value of the variable a is %2.8f', b);
fprintf(file_id, '\n\n variable a is still a value of %2.2f \n\n Bye again!', a); % put a newline (\fclose(file_id);

