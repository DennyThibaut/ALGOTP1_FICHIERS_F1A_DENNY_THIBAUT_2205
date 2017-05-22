program FichierConju;
uses crt;
CONST
	V1G='er';
	V2G='ir';
	aller='aller';
	
Procedure CreaFichier1 (var F:TextFile); // Creation du 1er fichier avec tout les verbes reunis
	begin
		Assign(F,'Verbes.txt');
		Rewrite(F);
			If (IOResult <> 0) Then   // Test pour voir si le fichier s'est bien cree
				writeln('Le fichier n''existe pas');
		close(F);
		Append(F);
		writeln(F,'rire');
		writeln(F,'recevoir');
		writeln(F,'aller');
		writeln(F,'bouillir');
		writeln(F,'envoyer');
		writeln(F,'peindre');
		writeln(F,'habiter');
		writeln(F,'payer');
		writeln(F,'mourir');
		writeln(F,'hair');
		writeln(F,'vouloir');
		writeln(F,'finir');
		writeln(F,'s''amuser');
		close(F);
	end;
Procedure CreaFichier2 (var G:TextFile);
	begin
		Assign(G,'Verbesconj.txt');
		Rewrite(G);
			If (IOResult <> 0) Then   // Test pour voir si le fichier s'est bien cree
				writeln('Le fichier n''existe pas');
		close(G);
	end;

Procedure Groupe_Verbes (var F:TextFile);
	var
		i:integer;
		ligne:string;
	begin
		reset(F);
		while not EOF(F) do
			begin
				readln(F,ligne);
					IF (COPY(ligne,length(ligne)-1,2)=V1G) AND NOT (ligne=aller) then //tchek les 2 dernieres lettres du verbe, s il trouve 'er' et que le mot n'est pas 'aller' c'est un vrb du 1er
						begin
							writeln(ligne,' est un verbe du 1er grp');
						end
					else IF (COPY(ligne,length(ligne)-1,2)=V2G) AND ((ligne='finir') OR (ligne='hair')) then //tchek les 2 dernieres lettres du verbe, s il trouve 'ir' et que le mot est finir ou hair c est du 2e
						writeln(ligne,' est un verbe du 2eme groupe')
					else writeln(ligne,' est un verbe du 3eme groupe');	 // Sinon c'est du 3eme grp					
			end;
		close(F);
	end;
Procedure ConjuVerbe1Grp(var F:TextFile;var G:TextFile);
	var
		ligne:string;
		i:integer;
		radical:string;
	begin
		reset(F);
		while not EOF(F) do
			begin
				readln(F,ligne);
					begin
						radical:=COPY(ligne,1,length(ligne)-2);
						Append(G);
						IF (COPY(ligne,length(ligne)-1,2)=V1G) AND NOT (ligne=aller) then
							begin
								writeln(G,'Je'+' '+ radical +'e');
								writeln(G,'Tu'+' '+ radical +'es');
								writeln(G,'Il/Elle/On'+' '+ radical +'e');
								writeln(G,'Nous'+' '+ radical +'ons');
								writeln(G,'Vous'+' '+ radical +'ez');
								writeln(G,'Ils/Elles'+' '+ radical +'ent');
							end;
						close(G);
					end;
			end;
		close(F);
	end;

					
Procedure Affichage2F (var G:TextFile);
	var
		ligne:string;
	begin
		reset(G);
			WHILE NOT EOF(G) do
				begin
					readln(G,ligne);
					writeln(ligne);
				end;
		close(G);
	end;
	
Procedure Affichage1F (var F:TextFile);
	var
		ligne:string;
	begin
		reset(F);
			WHILE NOT EOF(F) do
				begin
					readln(F,ligne);
					writeln(ligne);
				end;
		close(F);
	end;
var
	F,G:TextFile;
BEGIN
	clrscr;
	CreaFichier1(F);
	CreaFichier2(G);
	Affichage1F(F);
	Groupe_Verbes (F);
	ConjuVerbe1Grp(F,G);
	Affichage2F(G);
	readln;
END.	
		
