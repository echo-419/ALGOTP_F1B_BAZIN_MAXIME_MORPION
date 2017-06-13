program morpion;

uses crt,sysutils;

const 
	tot_v=3;		//nombre de manche à gagner pour gangner la partie

type

	tableau=array[1..5] of string;

type
		fiche_text=TEXT;

var
	symbole_j,joueurJ,joueurJ1,joueurJ2:string;
	ligne_1:tableau;
	ligne_2:tableau;
	ligne_3:tableau;
	ligne_grille:tableau;
	i,j,cpt_tour,cpt_manche,nbcoups,score_j1,score_j2:integer;
	test:boolean;
	f_partie:fiche_text;


procedure init_grille;
var i,j:integer;

begin
	for i:=1 to 5 do 
		ligne_grille[i]:='-';   //pour les lignes horizontales de la grille

	//pour la 1er ligne de la grille
	ligne_1[1]:='1';
	ligne_1[2]:='|';
	ligne_1[3]:='2';
	ligne_1[4]:='|';
	ligne_1[5]:='3';

	//pour la 2eme ligne de la grille
	ligne_2[1]:='4';
	ligne_2[2]:='|';
	ligne_2[3]:='5';
	ligne_2[4]:='|';
	ligne_2[5]:='6';

	//Pour la 3eme ligne de la grille 
	ligne_3[1]:='7';
	ligne_3[2]:='|';
	ligne_3[3]:='8';
	ligne_3[4]:='|';
	ligne_3[5]:='9';
end;

procedure affiche_grille;
begin
	// 1ere ligne de la grille 
	for i:=1 to 5 do
		write(ligne_1[i]);
	writeln;
	// 2eme ligne de la grille 
	for i:=1 to 5 do	
		write(ligne_grille[i]);
	writeln;
	// 3eme ligne de la grille 
	for i:=1 to 5 do
		write(ligne_2[i]);
	writeln;
	// 4eme ligne de la grille 
	for i:=1 to 5 do
		write(ligne_grille[i]);
	writeln;
	// 5eme ligne de la grille 
	for i:=1 to 5 do
		write(ligne_3[i]);
	

end;

procedure jouer;
	var 
		position:integer;
		test:boolean;

begin
	repeat
	begin
		test:=false;
		writeln('Joueur ',joueurJ,' ou voulez vous placer votre ',symbole_j);
		readln(position);
		case position of
			//si Ligne_1[position]<> X ou O
			1: begin
					if ligne_1[1]='1' then
						begin
						ligne_1[1]:=symbole_j;
						test:=true;
						end;
				end;
			2: begin
					if ligne_1[3]='2' then
						begin
						ligne_1[3]:=symbole_j;
						test:=true;
						end;
				end;
			3: begin
					if ligne_1[5]='3' then
						begin
						ligne_1[5]:=symbole_j;
						test:=true;
						end;
				end;

			//si Ligne_2[position]<> X ou O
			4: begin
					if ligne_2[1]='4' then
						begin
						ligne_2[1]:=symbole_j;
						test:=true;
						end;
				end;
			5: begin
					if ligne_2[3]='5' then
						begin
						ligne_2[3]:=symbole_j;
						test:=true;
						end;
				end;
			6: begin
					if ligne_2[5]='6' then
						begin
						ligne_2[5]:=symbole_j;
						test:=true;
						end;
				end;

			//si Ligne_3[position]<> X ou O
			7: begin
					if ligne_3[1]='7' then
						begin
						ligne_3[1]:=symbole_j;
						test:=true;
						end;
				end;
			8: begin
					if ligne_3[3]='8' then
						begin
						ligne_3[3]:=symbole_j;
						test:=true;
						end;
				end;
			9: begin
					if ligne_3[5]='9' then
						begin
						ligne_3[5]:=symbole_j;
						test:=true;
						end;
				end;

		end;

		//si Ligne_1[position]= X ou O
		if test=false then
			writeln('place indisponible')
	end;
	until test=true;
end;

//victoire si 3 symboles aligneés
function resultat_manche(symbole_j:string;joueurJ:string):boolean;
	var test_v:boolean;

begin	
		test_v:=false;
		//verif si victoire dans les 3 lignes
		if (ligne_1[1]=ligne_1[3]) and (ligne_1[1]=ligne_1[5]) then
			test_v:=true;
		if (ligne_2[1]=ligne_2[3]) and (ligne_2[1]=ligne_2[5]) then
			test_v:=true;
		if (ligne_3[1]=ligne_3[3]) and (ligne_3[1]=ligne_3[5]) then
			test_v:=true;

		//verif si victoire dans les 3 colonne
		if (ligne_1[1]=ligne_2[1]) and (ligne_1[1]=ligne_3[1]) then
			test_v:=true;
		if (ligne_1[3]=ligne_2[3]) and (ligne_1[3]=ligne_3[3]) then
			test_v:=true;
		if (ligne_1[5]=ligne_2[5]) and (ligne_1[5]=ligne_3[5]) then
			test_v:=true;

		//verif si victoire dans les 2 diagonales
		if (ligne_1[1]=ligne_2[3]) and (ligne_1[1]=ligne_3[5]) then
			test_v:=true;
		if (ligne_1[5]=ligne_2[3]) and (ligne_1[5]=ligne_1[1]) then
			test_v:=true;

		resultat_manche:=test_v;
end;
			
// definie qui joue et qui commencera
PROCeDURE commence(var joueurJ:string;var joueurJ1:string;var joueurJ2:string) ;				

begin

	writeln('Joueur 1 entrer votre pseudo');
	readln(joueurJ1);
	clrscr;
	writeln('Joueur 2 entrer votre pseudo');
	readln(joueurJ2);
	clrscr;

	writeln('il faut gagner ',tot_v,'x pour gagner la partie');
	writeln(joueurJ1,' commence');
	joueurJ:=joueurJ1;
	symbole_j:='X';
end;

//changement de joueurJ et de symbole_j
PROCEDURE switch (var joueurJ:string;var symbole_j:string)	;					

begin
	if joueurJ=joueurJ1 then
		begin
		joueurJ:=joueurJ2;
		symbole_j:='O';
		end
	else
		begin
		joueurJ:=joueurJ1;
		symbole_j:='X';
		end;

end;
		
begin
	cpt_manche:=0;
	score_j1:=0;
	score_j2:=0;
	assign(f_partie, 'fichier_morpion.txt');
	clrscr;
	commence(joueurJ,joueurJ1,joueurJ2) ;

	//verif si le fichier existe 
	if FileExists('ficher_morpion.txt') then
		begin
			append(f_partie);
			writeln(f_partie,'Les joueur sont :',joueurJ1,' et ',joueurJ2);
		end
	else 
		begin
		rewrite(f_partie);
		writeln(f_partie,'Les joueur sont :',joueurJ1,' et ',joueurJ2);
		end;
	close(f_partie);
	readln;



	repeat		//boucle de le partie
		begin
			cpt_tour:=0;
			nbcoups:=0;
			init_grille;
			test:=false;	
			repeat				//boucle d'une manche
				begin
				clrscr;
				
				writeln('score de ',joueurJ1,': ',score_j1);	
				writeln('score de ',joueurJ2,': ',score_j2);
				affiche_grille;
				writeln();
				jouer;
				test:=resultat_manche(symbole_j,joueurJ);
				switch(joueurJ,symbole_j);
				cpt_tour:=cpt_tour+1;
				end;
			until (test=true) or (cpt_tour=9);
			cpt_manche:=cpt_manche+1;

			if cpt_tour=9 then
				begin
					append(f_partie);
						writeln(f_partie,'Manche ',cpt_manche,' Egalité');
					close(f_partie);
					writeln('egalite');
					readln;
				end
				else
				begin
					nbcoups:=trunc(cpt_tour/2);
					append(f_partie);
						writeln(f_partie,'Manche ',cpt_manche,' Perdu par ',joueurJ,' après ',nbcoups, ' coups.');
					close(f_partie);
					writeln(joueurJ,' a perdu la manche');	
					if joueurJ=joueurJ1 then
							score_j2:=score_j2+1
						else
							score_j1:=score_j1+1;
					readln;	
					end;
				end;
				until (score_j2=tot_v )or (score_j1=tot_v);	

				if (score_j2=tot_v) then 
				begin
					writeln(joueurJ2, ' a gagner la partie');
					append(f_partie);
						writeln(f_partie,'Le Gagnant est ',joueurJ2);
					close(f_partie);
				end;
				if (score_j1=tot_v) then
				begin
					writeln(joueurJ1, ' a gagner la partie');
					append(f_partie);
						writeln(f_partie,'Le Gagnant est ',joueurJ1);
					close(f_partie);
				end;
	readln;				
end.
