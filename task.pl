% Утверждения по условию задачи
human('Levin').
human('Miterev').
human('Nabatov').

job('buhgalter').
job('cassir').
job('schetovod').

% Запись условий по задаче
condition('Nabatov',N,'Miterev',M,'Levin',L):- 
    (N='cassir',!,M='schetovod');
    (N='schetovod',!,M='buhgalter');
    (M\='cassir',!,L\='schetovod');
    (L='buhgalter',!,N='schetovod').

% Основной предикат
solve(Result):-
    Result=[[Human1,Job1],[Human2,Job2],[Human3,Job3]],
    human(Human1),
    human(Human2),
    human(Human3),
	
    Human1\=Human2,Human1\=Human3,Human2\=Human3,
        
    job(Job1),
    job(Job2),
    job(Job3),
        
    Job1\=Job2,Job1\=Job3,Job2\=Job3,
        
    conditions(Human1,Job1,Human2,Job2,Human3,Job3),!.