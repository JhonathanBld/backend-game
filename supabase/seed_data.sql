-- ==========================================
-- GAMES INSERTS
-- ==========================================

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'impostor-palavra', 'Jogo do Impostor', 'Palavra Secreta', 'Um jogo de dedução e criatividade onde todos sabem a palavra secreta, exceto um. Descubra quem está mentindo!', 
    'Todos recebem a mesma palavra secreta, exceto o Impostor. O objetivo é descobrir quem ele é através de dicas que provam que você sabe a palavra, sem entregá-la de bandeja.', 'Em cada rodada, cada jogador diz uma única palavra relacionada à palavra secreta. O Impostor tenta se misturar dando dicas vagas ou copiando a lógica dos outros.', 
    '[{"title":"Distribuição","description":"Todos veem sua palavra secreta no celular. O Impostor vê apenas ''VOCÊ É O IMPOSTOR''.","icon":{}},{"title":"Rodada de Dicas","description":"Um por vez, cada jogador diz UMA palavra dica relacionada ao tema.","icon":{}},{"title":"Debate","description":"O grupo discute quem deu a dica mais suspeita ou desconexa.","icon":{}},{"title":"Votação","description":"Todos apontam para quem acham que é o Impostor. Se a maioria acertar, a vitória é do grupo.","icon":{}}]'::jsonb, '[{"title":"Cenário","content":"A palavra secreta é ''PIRÂMIDE''. O Impostor não sabe."},{"title":"Jogador A","content":"''Egito'' (Dica boa, direta)."},{"title":"Jogador B","content":"''Triângulo'' (Boa, descreve a forma)."},{"title":"Impostor","content":"''Antigo'' (Vaga, mas segura. Tenta se misturar)."},{"title":"Jogador C","content":"''Faraó'' (Boa)."},{"title":"Conclusão","content":"O grupo pode desconfiar do Impostor por ser muito genérico, mas pode passar batido."}]'::jsonb, '[{"team":"Inocentes","condition":"Identificar corretamente o Impostor na votação."},{"team":"Impostor","condition":"Não ser descoberto na votação OU adivinhar a palavra secreta se for pego."}]'::jsonb, 
    '["Dar dicas óbvias demais (ajuda o Impostor a descobrir a palavra).","Dar dicas internas que só você entende (o grupo vai achar que você é o Impostor).","Ficar muito quieto ou nervoso na hora de dar a dica."]'::jsonb, '["Seja sutil: sua dica deve ser clara para quem sabe a palavra, mas confusa para quem não sabe.","Impostor: tente ser o último a falar para pegar o contexto das dicas anteriores."]'::jsonb, '{"beginner":["Inocentes: Pensem em características secundárias da palavra (cor, material, uso).","Impostor: Use palavras que servem para muitas coisas (ex: ''Grande'', ''Legal'', ''Importante'')."],"advanced":["Inocentes: Façam referências a rodadas anteriores ou piadas internas do grupo que se conectem à palavra.","Impostor: Tente acusar alguém que deu uma dica ruim para tirar o foco de você."]}'::jsonb, 
    '["O sistema escolhe uma palavra secreta para o grupo.","O impostor não sabe a palavra.","Cada jogador diz UMA dica.","Se o impostor for descoberto, ele tem uma chance de chutar a palavra para vencer."]'::jsonb, 3, 12, '5-10 min', 
    'Iniciante', 'var(--primary)', 'Search'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'impostor-perguntas', 'Impostor', 'Perguntas Diferentes', 'Duas perguntas parecidas, mas com respostas diferentes. Quem está respondendo a pergunta errada?', 
    'O grupo recebe uma pergunta (ex: ''Qual sua cor favorita?'') e o Impostor recebe outra parecida (ex: ''Qual a cor do céu?''). Ninguém sabe qual é a sua pergunta em relação aos outros.', 'Todos respondem à sua pergunta em voz alta. As respostas vão parecer estranhas para quem tem a pergunta diferente. O objetivo é notar essa discrepância.', 
    '[{"title":"Leitura","description":"Todos leem sua pergunta silenciosamente.","icon":{}},{"title":"Respostas","description":"Cada um responde sua pergunta em voz alta.","icon":{}},{"title":"Análise","description":"O grupo percebe que alguém respondeu algo que não faz sentido para a SUA pergunta.","icon":{}},{"title":"Votação","description":"Votam em quem parece ter a pergunta diferente.","icon":{}}]'::jsonb, '[{"title":"Perguntas","content":"Grupo: ''O que você come no café da manhã?'' | Impostor: ''O que você come no almoço?''"},{"title":"Jogador A","content":"''Pão com manteiga''."},{"title":"Jogador B","content":"''Cereal''."},{"title":"Impostor","content":"''Feijoada'' (Normal para almoço, estranho para café)."},{"title":"Conclusão","content":"Todos olham estranho para o Impostor. Ele é descoberto."}]'::jsonb, '[{"team":"Grupo","condition":"Identificar quem tem a pergunta diferente."},{"team":"Impostor","condition":"Convencer o grupo que sua resposta faz sentido ou que outra pessoa é o impostor."}]'::jsonb, 
    '["Impostor responder muito especificamente sem ouvir os outros.","Grupo rir imediatamente da resposta do impostor (entrega o jogo antes da votação)."]'::jsonb, '["Responda de forma que faça sentido para sua pergunta, mas tente ser vago se desconfiar que é o impostor."]'::jsonb, '{"beginner":["Preste atenção não só no QUE foi dito, mas COMO foi dito."],"advanced":["Se sua pergunta parece muito absurda, talvez você seja o impostor. Tente suavizar a resposta."]}'::jsonb, 
    '["Perguntas diferentes são distribuídas.","Responda sua pergunta em voz alta.","Debata as diferenças.","Vote no suspeito."]'::jsonb, 3, 10, '10-15 min', 
    'Iniciante', 'var(--neon-purple)', 'Brain'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'spyfall', 'Spyfall', 'Descubra o Espião', 'Um espião invadiu um local secreto! Façam perguntas para descobrir quem não sabe onde vocês estão.', 
    'Todos os jogadores recebem o mesmo local (ex: Estação Espacial), menos o Espião. Os jogadores fazem perguntas uns aos outros para provar que sabem onde estão, sem revelar o local para o Espião.', 'O jogo funciona em um cronômetro. Jogadores fazem perguntas uns aos outros (ex: ''Aqui faz frio?''). O Espião tenta mentir e deduzir o local pelas perguntas.', 
    '[{"title":"Sorteio","description":"O local é definido. O Espião vê apenas ''ESPIÃO''.","icon":{}},{"title":"Interrogatório","description":"O cronômetro inicia. Jogador A pergunta para Jogador B.","icon":{}},{"title":"Dedução","description":"As respostas ajudam a identificar quem não sabe do que está falando.","icon":{}},{"title":"Acusação","description":"A qualquer momento, pause o jogo para acusar alguém. Se for unânime (menos o acusado), o jogo acaba.","icon":{}}]'::jsonb, '[{"title":"Local","content":"Escola."},{"title":"Jogador A (para B)","content":"''A gente costuma vir aqui de fim de semana?''"},{"title":"Jogador B","content":"''Não, geralmente não. Graças a Deus.'' (Resposta segura)."},{"title":"Jogador B (para Espião)","content":"''O que a gente come aqui?''"},{"title":"Espião","content":"''Ah... coisas chiques?'' (Erro! Escola tem merenda/cantina)."}]'::jsonb, '[{"team":"Não-Espiões","condition":"Votar unanimemente no Espião correto."},{"team":"Espião","condition":"Não ser descoberto ao final do tempo OU adivinhar o local a qualquer momento."}]'::jsonb, 
    '["Perguntar ''Onde estamos?''.","Dar respostas muito óbvias que entregam o local para o espião.","Espião ficar muito calado (muito suspeito)."]'::jsonb, '["Faça perguntas baseadas em sensações, cheiros ou rotinas, não apenas visuais.","Se você é o Espião, ouça atentamente antes de responder qualquer coisa."]'::jsonb, '{"beginner":["Use perguntas de ''Sim/Não'' no início para não arriscar muito."],"advanced":["Espião: Se for descoberto, chute o local imediatamente. Tente deduzir pelas perguntas que fizeram."]}'::jsonb, 
    '["Local secreto compartilhado.","Espião não sabe o local.","Perguntas e respostas rodada a rodada.","Acuse o espião ou o espião adivinha o local."]'::jsonb, 3, 8, '10-15 min', 
    'Iniciante', 'var(--neon-blue)', 'Search'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'the-resistance', 'The Resistance', 'Sabotadores Ocultos', 'Uma batalha de dedução social entre a Resistência e os Espiões Imperiais. Missões, traições e muita desconfiança.', 
    'O grupo tenta completar 3 missões com sucesso. Porém, espiões infiltrados tentarão sabotar as missões sem serem descobertos. O líder muda a cada rodada.', 'O Líder propõe um time para a missão. Todos votam se aceitam o time. Se aceito, o time vai para a missão e secretamente joga carta de ''Sucesso'' ou ''Falha''.', 
    '[{"title":"Proposta","description":"O Líder da rodada escolhe os jogadores (Team) para a missão atual.","icon":{}},{"title":"Votação de Time","description":"Todos levantam a mão (ou votam) para aprovar ou rejeitar esse time.","icon":{}},{"title":"Missão","description":"Se aprovado, o time escolhido vota secretamente: Sucesso ou Falha.","icon":{}},{"title":"Resultado","description":"As cartas são misturadas e reveladas. Se houver falhas, a missão fracassou.","icon":{}}]'::jsonb, '[{"title":"Time Proposto","content":"Líder escolhe Ana e Bruno."},{"title":"Votação","content":"Maioria aprova o time."},{"title":"Ação","content":"Ana é Resistência (joga Sucesso). Bruno é Espião (joga Falha)."},{"title":"Resultado","content":"1 Sucesso, 1 Falha. Missão FALHOU! (Dependendo da regra, 1 falha basta)."},{"title":"Consequência","content":"Agora todos sabem que Ana OU Bruno (ou ambos) são espiões."}]'::jsonb, '[{"team":"Resistência","condition":"Conseguir 3 SUCESSOS de missão."},{"team":"Espiões","condition":"Causar 3 FALHAS de missão OU rejeitar 5 times seguidos."}]'::jsonb, 
    '["Espiões falharem todas as missões cedo demais (se entrega rápido).","Resistência votar ''Não'' sem motivo e travar o jogo."]'::jsonb, '["A informação é sua maior arma. Observe quem aprova times que falharam."]'::jsonb, '{"beginner":["Resistência: Nunca coloque alguém suspeito no time.","Espião: Às vezes vale a pena jogar ''Sucesso'' para ganhar a confiança."],"advanced":["Conte os votos! Quem votou para aprovar um time sabotado é provavelmente parceiro do sabotador."]}'::jsonb, 
    '["Identidades secretas.","Líder propõe time, grupo vota.","Time vota sucesso/falha.","3 Sucessos = Vitória Resistência, 3 Falhas = Vitória Espiões."]'::jsonb, 5, 10, '20-30 min', 
    'Intermediário', 'var(--primary)', 'Shield'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'lobisomem', 'Lobisomem', 'Werewolf', 'O clássico jogo da vila. Sobreviva à noite e elimine os monstros durante o dia.', 
    'O jogo alterna entre NOITE (onde monstros matam) e DIA (onde a vila discute e vota para linchar alguém). Papéis especiais ajudam os dois lados.', 'Requer um narrador (ou app). À noite, todos fecham os olhos e os lobos escolhem uma vítima. De dia, a vítima é revelada e os sobreviventes debatem.', 
    '[{"title":"Noite","description":"Aldeia dorme. Lobos acordam e matam. Vidente acorda e investiga.","icon":{}},{"title":"Amanhecer","description":"Narrador revela quem morreu.","icon":{}},{"title":"Debate","description":"Sobreviventes acusam suspeitos baseados em barulhos ou comportamento.","icon":{}},{"title":"Forca","description":"Votação para eliminar um jogador suspeito. O eliminado revela seu papel (opcional).","icon":{}}]'::jsonb, '[{"title":"Noite","content":"Lobos escolhem matar Pedro. Vidente investiga João (vê que é inocente)."},{"title":"Dia","content":"Pedro está morto. João diz ''Eu sou Vidente, investiguei o Lucas e ele é Lobo!'' (Mentira ou Verdade?)."},{"title":"Debate","content":"Lucas se defende. A vila escolhe entre acreditar em João ou Lucas."}]'::jsonb, '[{"team":"Aldeia","condition":"Matar todos os Lobisomens."},{"team":"Lobos","condition":"Igualar o número de Lobos ao de Aldeões."}]'::jsonb, 
    '["Falar demais sendo lobo (chama atenção).","Ficar mudo sendo aldeão (parece que tem algo a esconder)."]'::jsonb, '["Vidente é a peça chave. Não se revele cedo demais a não ser que seja para salvar o jogo."]'::jsonb, '{"beginner":["Lobos: Combinem um alvo antes ou sigam o líder silenciosamente."],"advanced":["Lobos: Um lobo pode se sacrificar acusando outro lobo para ''provar'' inocência do parceiro."]}'::jsonb, 
    '["Papéis: Lobisomem, Vidente, Aldeão, etc.","Fases: Noite (Ações) e Dia (Debate).","Votação elimina um jogador por dia."]'::jsonb, 6, 18, '20-40 min', 
    'Intermediário', 'var(--neon-purple)', 'Skull'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'avalon', 'Avalon', 'Leais vs Traidores', 'Versão temática de ''The Resistance'' com papéis especiais. Merlin sabe tudo, mas deve permanecer oculto.', 
    'Arthurianos (Bem) tentam completar missões. Servos de Mordred (Mal) tentam sabotar. Merlin conhece os maus, mas se o Assassino descobrir quem é Merlin no final, o Mal vence.', 'Similar ao Resistance: Líder monta equipe -> Votação da Equipe -> Missão (Sucesso/Falha). A diferença são os poderes especiais e a fase final de caça ao Merlin.', 
    '[{"title":"Fase da Equipe","description":"Líder escolhe quem vai na missão.","icon":{}},{"title":"Votação","description":"A mesa aprova ou rejeita a equipe.","icon":{}},{"title":"Missão","description":"Membros da equipe jogam carta de Sucesso/Falha.","icon":{}},{"title":"Caça ao Merlin","description":"Se o Bem vencer 3 missões, o Assassino tem uma chance de matar Merlin e roubar a vitória.","icon":{}}]'::jsonb, '[{"title":"Situação","content":"O Bem venceu 3 missões. Vitória? Ainda não."},{"title":"Assassino","content":"Discute com os outros maus: ''Quem parecia saber demais? Quem guiou as votações?''"},{"title":"Acusação","content":"Assassino aponta para Marcos: ''Você é Merlin!''."},{"title":"Revelação","content":"Se Marcos for Merlin, o Mal vence. Se não, o Bem vence."}]'::jsonb, '[{"team":"Bem","condition":"3 Sucessos E proteger Merlin."},{"team":"Mal","condition":"3 Falhas OU Matar Merlin no final."}]'::jsonb, 
    '["Merlin ser muito óbvio ao acusar os maus.","Percival (guarda-costas) não proteger Merlin nas discussões."]'::jsonb, '["Se você é Merlin, guie o grupo através de perguntas, não de afirmações."]'::jsonb, '{"beginner":["Maus: Tente descobrir quem é Merlin observando quem vota sempre certo."],"advanced":["Percival: Finja ser Merlin para atrair a atenção do Assassino."]}'::jsonb, 
    '["Bem vs Mal.","Merlin conhece os maus.","Missões decidem o jogo.","Final: Assassino tenta matar Merlin."]'::jsonb, 5, 10, '30 min', 
    'Avançado', 'var(--neon-blue)', 'Swords'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'coup', 'Coup', 'Blefe e Poder', 'Você é o chefe de uma família em uma cidade corrupta. Destrua a influência das outras famílias e seja o último sobrevivente.', 
    'Cada jogador começa com 2 cartas e 2 moedas. O objetivo é eliminar as cartas dos adversários. Você pode realizar ações de qualquer carta, DESDE QUE NINGUÉM DUVIDE.', 'Turnos rápidos. Na sua vez, diga o que vai fazer (ex: ''Pego 3 moedas como Duque''). Se ninguém desafiar, você faz. Se desafiarem, quem mentiu (ou errou o desafio) perde uma carta.', 
    '[{"title":"Ação","description":"Escolha uma ação: Renda, Ajuda Externa, Golpe ou Ação de Personagem.","icon":{}},{"title":"Blefe","description":"Você pode anunciar uma ação de um personagem que NÃO tem.","icon":{}},{"title":"Desafio","description":"Qualquer um pode dizer ''Eu duvido!''. O acusado deve provar.","icon":{}},{"title":"Resolução","description":"Quem perder o desafio vira uma carta. Quem perder as duas, sai do jogo.","icon":{}}]'::jsonb, '[{"title":"Jogador A","content":"''Eu sou o Duque, pego 3 moedas''."},{"title":"Jogador B","content":"''Duvido! Mostre o Duque.'' (Desafio)."},{"title":"Jogador A","content":"Mostra um Capitão. (Mentiu!)."},{"title":"Consequência","content":"Jogador A perde o Capitão. Agora só tem 1 vida."}]'::jsonb, '[{"team":"Individual","condition":"Ser o único jogador com pelo menos uma carta na mão."}]'::jsonb, 
    '["Juntar 7 moedas e não dar o Golpe de Estado (é obrigatório).","Desafiar tudo (você vai perder cartas rápido)."]'::jsonb, '["No começo, Renda (1 moeda) é seguro. Ajuda Externa (2 moedas) atrai o Duque."]'::jsonb, '{"beginner":["Sempre diga que tem o Duque quando tentarem pegar Ajuda Externa."],"advanced":["Fingir ter cartas que não tem no início para condicionar os oponentes."]}'::jsonb, 
    '["2 Cartas de vida.","Ações: Renda (1), Ajuda (2), Golpe (7 - Mata 1).","Personagens: Duque, Assassino, Condessa, Capitão, Embaixador.","Desafios eliminam cartas."]'::jsonb, 2, 6, '10-15 min', 
    'Intermediário', 'var(--primary)', 'Zap'
  ) ON CONFLICT (id) DO NOTHING;

INSERT INTO games (
    id, title, subtitle, description, match_summary, how_it_works, 
    step_by_step, example_round, how_to_win, common_mistakes, quick_tips, 
    strategies, rules, min_players, max_players, duration, level, color, icon_name
  ) VALUES (
    'deception', 'Deception', 'Murder in Hong Kong', 'Um crime, pistas forenses e um assassino entre nós. O Legista tenta comunicar a verdade sem falar.', 
    'O Assassino escolhe Arma e Evidência. O Legista sabe a resposta e dá dicas usando placas de cenário (ex: ''Local: Sala'', ''Causa: Perda de Sangue''). Investigadores debatem.', 'Investigadores têm distintivos para tentar adivinhar o par Arma + Evidência. O Assassino tenta confundir o grupo dando palpites errados convincentes.', 
    '[{"title":"Crime","description":"Todos fecham os olhos. Assassino aponta Arma e Evidência para o Legista.","icon":{}},{"title":"Pistas","description":"Legista escolhe opções nas placas para descrever o crime.","icon":{}},{"title":"Debate","description":"Todos discutem as pistas. ''Perda de sangue... pode ser a Faca?''","icon":{}},{"title":"Apresentação","description":"Cada jogador tem 30s para dar sua teoria.","icon":{}}]'::jsonb, '[{"title":"Crime Real","content":"Arma: Gelo Seco. Evidência: Água."},{"title":"Pista do Legista","content":"''Estado da cena: Molhado''."},{"title":"Investigador","content":"''Molhado... pode ser afogamento? Ou gelo derretido?''"},{"title":"Assassino","content":"''Acho que é afogamento, a arma deve ser a Corda.'' (Desviando)."}]'::jsonb, '[{"team":"Investigadores","condition":"Acertar a Arma E Evidência correta."},{"team":"Assassino","condition":"O tempo acabar sem ninguém acertar."}]'::jsonb, 
    '["Legista tentar ser literal demais (às vezes precisa ser metafórico).","Investigadores gastarem suas tentativas de chute muito cedo."]'::jsonb, '["Olhe as cartas na mesa! As pistas devem eliminar o que NÃO é possível."]'::jsonb, '{"beginner":["Foque em eliminar o impossível primeiro."],"advanced":["Assassino: Escolha itens que se pareçam com outros da mesa para confundir o Legista."]}'::jsonb, 
    '["Legista não fala.","Assassino escolhe Arma/Pista.","Investigadores têm 1 chance de acusar cada.","3 Rodadas de pistas."]'::jsonb, 4, 12, '20 min', 
    'Avançado', 'var(--neon-purple)', 'Search'
  ) ON CONFLICT (id) DO NOTHING;

-- ==========================================
-- GAME CONTENT INSERTS
-- ==========================================

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Peido', 
      '["Barulho","Cheiro","Vergonha","Silencioso","Elevador"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Mico', 
      '["Vergonha","Tombo","Riso","Público","Constrangimento"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Tombão', 
      '["Chão","Dor","Risos","Tropeço","Desastre"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Gafe', 
      '["Erro","Silêncio","Olhares","Climão","Constrangimento"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Fofoca', 
      '["Segredo","Grupo","Confusão","Drama","Vazou"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Vergonha', 
      '["Rosto Vermelho","Silêncio","Olhar","Constrangimento","Riso"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Cantada', 
      '["Fracasso","Tentativa","Romance","Constrangedora","Riso"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Zueira', 
      '["Brincadeira","Amigos","Riso","Caos","Exagero"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Treta', 
      '["Discussão","Drama","Grupo","Confusão","Climão"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Bafão', 
      '["Escândalo","Fofoca","Viral","Drama","Exposição"]'::jsonb, 'Besteirol', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Ônibus', 
      '["Passageiro","Motorista","Ponto","Assento","Bilhete"]'::jsonb, 'Transporte', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Metrô', 
      '["Estação","Trilho","Vagão","Catacra","Lotado"]'::jsonb, 'Transporte', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Elevador', 
      '["Andar","Botão","Prédio","Fechado","Subir"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Bar', 
      '["Bebida","Amigos","Música","Balcão","Noite"]'::jsonb, 'Lazer', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Balada', 
      '["Dança","DJ","Luzes","Festa","Som Alto"]'::jsonb, 'Lazer', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Sorvete', 
      '["Frio","Doce","Casquinha","Verão","Sabor"]'::jsonb, 'Comida', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Hambúrguer', 
      '["Carne","Pão","Queijo","Molho","Lanche"]'::jsonb, 'Comida', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Pizza', 
      '["Fatia","Queijo","Forno","Entrega","Massa"]'::jsonb, 'Comida', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Celular', 
      '["Aplicativo","Tela","Mensagem","Bateria","Internet"]'::jsonb, 'Tecnologia', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Computador', 
      '["Teclado","Mouse","Tela","Trabalho","Internet"]'::jsonb, 'Tecnologia', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Videogame', 
      '["Controle","Jogo","Tela","Console","Competição"]'::jsonb, 'Lazer', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Piscina', 
      '["Água","Mergulho","Verão","Cloro","Borda"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Montanha', 
      '["Altura","Trilha","Frio","Escalada","Vista"]'::jsonb, 'Natureza', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Floresta', 
      '["Árvore","Animais","Sombra","Trilha","Silêncio"]'::jsonb, 'Natureza', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Deserto', 
      '["Areia","Calor","Sol","Seco","Cacto"]'::jsonb, 'Natureza', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Ilha', 
      '["Mar","Isolado","Praia","Barco","Coqueiro"]'::jsonb, 'Natureza', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Show', 
      '["Palco","Cantor","Multidão","Música","Luzes"]'::jsonb, 'Lazer', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Carnaval', 
      '["Fantasia","Festa","Bloco","Música","Rua"]'::jsonb, 'Evento', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Natal', 
      '["Presente","Família","Ceia","Árvore","Papai Noel"]'::jsonb, 'Evento', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Aniversário', 
      '["Bolo","Festa","Presente","Velas","Parabéns"]'::jsonb, 'Evento', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Banco', 
      '["Dinheiro","Conta","Cartão","Fila","Caixa"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Delegacia', 
      '["Polícia","Crime","Denúncia","Investigação","Cela"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Farmácia', 
      '["Remédio","Receita","Saúde","Atendente","Dor"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Feira', 
      '["Fruta","Verdura","Barraca","Pastel","Rua"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Praça', 
      '["Banco","Árvore","Fonte","Crianças","Encontro"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Café', 
      '["Bebida","Manhã","Quente","Amargo","Xícara"]'::jsonb, 'Comida', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Praia', 
      '["Areia","Sol","Mar","Verão","Onda"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Hospital', 
      '["Médico","Emergência","Doença","Cirurgia","Paciente"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Cinema', 
      '["Filme","Pipoca","Escuro","Tela","Ingresso"]'::jsonb, 'Lazer', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Futebol', 
      '["Bola","Gol","Time","Estádio","Juiz"]'::jsonb, 'Lazer', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Escola', 
      '["Professor","Aluno","Aula","Prova","Caderno"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Churrasco', 
      '["Carne","Brasa","Fogo","Festa","Fim de Semana"]'::jsonb, 'Comida', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Casamento', 
      '["Noivos","Festa","Aliança","Vestido","Cerimônia"]'::jsonb, 'Geral', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Aeroporto', 
      '["Avião","Viagem","Embarque","Bagagem","Passaporte"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Neve', 
      '["Frio","Branco","Inverno","Gelo","Montanha"]'::jsonb, 'Geral', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Restaurante', 
      '["Comida","Garçom","Mesa","Cardápio","Conta"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Academia', 
      '["Exercício","Peso","Treino","Saúde","Suor"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Parque', 
      '["Árvore","Banco","Natureza","Crianças","Ar Livre"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Shopping', 
      '["Loja","Compra","Escada Rolante","Praça de Alimentação","Vitrine"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-palavra', 'palavra', 'Navio', 
      '["Mar","Capitão","Porto","Viagem","Âncora"]'::jsonb, 'Lugares', NULL, 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual é o melhor horário do dia?', 
      NULL, NULL, NULL, 
      NULL, 'Qual é o pior horário do dia?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual comida você nunca enjoa?', 
      NULL, NULL, NULL, 
      NULL, 'Qual comida você não suporta?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual superpoder você escolheria?', 
      NULL, NULL, NULL, 
      NULL, 'Qual superpoder você jamais escolheria?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual lugar você visitaria agora?', 
      NULL, NULL, NULL, 
      NULL, 'Qual lugar você evitaria visitar?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual objeto você levaria para uma ilha deserta?', 
      NULL, NULL, NULL, 
      NULL, 'Qual objeto seria inútil em uma ilha deserta?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual profissão você teria se dinheiro não fosse problema?', 
      NULL, NULL, NULL, 
      NULL, 'Qual profissão você nunca teria?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual animal representa sua personalidade?', 
      NULL, NULL, NULL, 
      NULL, 'Qual animal menos combina com você?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual estação do ano você prefere?', 
      NULL, NULL, NULL, 
      NULL, 'Qual estação do ano você menos gosta?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual filme você assistiria novamente?', 
      NULL, NULL, NULL, 
      NULL, 'Qual filme você não assistiria de novo?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual aplicativo você mais usa?', 
      NULL, NULL, NULL, 
      NULL, 'Qual aplicativo você apagaria do celular?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual esporte você praticaria?', 
      NULL, NULL, NULL, 
      NULL, 'Qual esporte você nunca praticaria?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual comida define sua infância?', 
      NULL, NULL, NULL, 
      NULL, 'Qual comida estragaria sua infância?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual cidade você moraria?', 
      NULL, NULL, NULL, 
      NULL, 'Qual cidade você odeia?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual medo é mais comum?', 
      NULL, NULL, NULL, 
      NULL, 'Qual medo é mais irracional?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual hobby você gostaria de ter?', 
      NULL, NULL, NULL, 
      NULL, 'Qual hobby você jamais teria?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual jogador de futebol você acha bom?', 
      NULL, NULL, NULL, 
      NULL, 'Qual jogador de futebol você acha superestimado?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual time você torce?', 
      NULL, NULL, NULL, 
      NULL, 'Qual time você não suporta?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual esporte você mais gosta?', 
      NULL, NULL, NULL, 
      NULL, 'Qual esporte você menos gosta?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual atleta você admira?', 
      NULL, NULL, NULL, 
      NULL, 'Qual atleta você acha exageradamente famoso?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual desculpa você já usou para faltar algo?', 
      NULL, NULL, NULL, 
      NULL, 'Qual desculpa é claramente mentira?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual comida você ama mas todo mundo julga?', 
      NULL, NULL, NULL, 
      NULL, 'Qual comida você julga mas todo mundo ama?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual hábito estranho você tem?', 
      NULL, NULL, NULL, 
      NULL, 'Qual hábito estranho você acha bizarro?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual mania você tem antes de dormir?', 
      NULL, NULL, NULL, 
      NULL, 'Qual mania é totalmente desnecessária?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual famoso você sairia para jantar?', 
      NULL, NULL, NULL, 
      NULL, 'Qual famoso você evitaria encontrar?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual opinião sua sempre gera discussão?', 
      NULL, NULL, NULL, 
      NULL, 'Qual opinião você acha absurda?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual filme é muito bom?', 
      NULL, NULL, NULL, 
      NULL, 'Qual filme é superestimado?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual série merece outra temporada?', 
      NULL, NULL, NULL, 
      NULL, 'Qual série deveria ter acabado antes?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual rede social você mais usa?', 
      NULL, NULL, NULL, 
      NULL, 'Qual rede social é mais tóxica?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual é o maior red flag em um encontro?', 
      NULL, NULL, NULL, 
      NULL, 'Qual é um red flag que você ignora?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual lugar é mais romântico?', 
      NULL, NULL, NULL, 
      NULL, 'Qual lugar estraga totalmente o clima?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual tipo de pessoa mais te atrai?', 
      NULL, NULL, NULL, 
      NULL, 'Qual tipo de pessoa você evitaria?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual situação é constrangedora em público?', 
      NULL, NULL, NULL, 
      NULL, 'Qual situação é constrangedora em privado?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual cantada funciona melhor?', 
      NULL, NULL, NULL, 
      NULL, 'Qual cantada é vergonhosa?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual seria um date perfeito?', 
      NULL, NULL, NULL, 
      NULL, 'Qual seria um date desastroso?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual hábito de casal é fofo?', 
      NULL, NULL, NULL, 
      NULL, 'Qual hábito de casal é irritante?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual bebida você prefere em festa?', 
      NULL, NULL, NULL, 
      NULL, 'Qual bebida você evita em festa?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual música anima qualquer festa?', 
      NULL, NULL, NULL, 
      NULL, 'Qual música acaba com a festa?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Quem é mais provável de passar vergonha na festa?', 
      NULL, NULL, NULL, 
      NULL, 'Quem é mais provável de fingir que não passou vergonha?'
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'impostor-perguntas', 'pergunta', 'Qual situação já deu errado em uma festa?', 
      NULL, NULL, NULL, 
      NULL, 'Qual situação você morre de medo que aconteça numa festa?'
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Hospital', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Escola', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Aeroporto', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Praia', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Submarino', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Estação Espacial', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Navio Pirata', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Restaurante de Luxo', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Delegacia', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Shopping', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Show de Rock', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Parque de Diversões', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Cassino', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Hotel', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Fazenda', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Circo', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Navio de Cruzeiro', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Base Militar', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Biblioteca', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'spyfall', 'spyfall_location', 'Estádio de Futebol', 
      NULL, NULL, NULL, 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Lobisomem', 
      NULL, 'Lobos', 'À noite, escolha uma vítima com os outros lobos.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Aldeão', 
      NULL, 'Vila', 'Sem poder especial. Ajude a vila a encontrar os lobos.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Vidente', 
      NULL, 'Vila', 'À noite, descubra o papel de um jogador.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Bruxa', 
      NULL, 'Vila', 'Tem uma poção de cura e uma de veneno.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Caçador', 
      NULL, 'Vila', 'Se morrer, pode levar alguém junto.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Guarda', 
      NULL, 'Vila', 'Protege um jogador do ataque dos lobos à noite.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Cupido', 
      NULL, 'Vila', 'Une dois jogadores pelo amor (se um morre, o outro morre).', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Médium', 
      NULL, 'Vila', 'Pode se comunicar com os mortos ou saber se eram bons.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Ancião', 
      NULL, 'Vila', 'Sobrevive ao primeiro ataque dos lobos.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'lobisomem', 'werewolf_role', 'Traidor', 
      NULL, 'Vila', 'Aldeão que vence se os lobos vencerem.', 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Merlin', 
      NULL, 'Bem', 'Conhece os maus, mas deve permanecer oculto.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Percival', 
      NULL, 'Bem', 'Conhece Merlin (vê Merlin e Morgana).', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Morgana', 
      NULL, 'Mal', 'Se passa por Merlin para enganar Percival.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Assassino', 
      NULL, 'Mal', 'Tenta descobrir e matar Merlin no final do jogo.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Mordred', 
      NULL, 'Mal', 'Não é revelado para Merlin.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Servo Leal de Arthur', 
      NULL, 'Bem', 'Servo leal sem poderes especiais.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Lacaio de Mordred', 
      NULL, 'Mal', 'Servo do mal sem poderes especiais.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'avalon', 'avalon_role', 'Oberon', 
      NULL, 'Mal', 'Do mal, mas não conhece os outros maus (e eles não o conhecem).', 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'coup', 'coup_role', 'Duque', 
      NULL, 'Personagem', 'Recebe 3 moedas. Bloqueia Ajuda Externa.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'coup', 'coup_role', 'Assassino', 
      NULL, 'Personagem', 'Paga 3 moedas para assassinar alguém.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'coup', 'coup_role', 'Capitão', 
      NULL, 'Personagem', 'Rouba 2 moedas de outro jogador. Bloqueia roubo.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'coup', 'coup_role', 'Embaixador', 
      NULL, 'Personagem', 'Troca cartas com o baralho. Bloqueia roubo.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'coup', 'coup_role', 'Condessa', 
      NULL, 'Personagem', 'Bloqueia assassinato contra você.', 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'the-resistance', 'resistance_role', 'Resistência', 
      NULL, 'Bem', 'Opere para o sucesso das missões.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'the-resistance', 'resistance_role', 'Espião', 
      NULL, 'Mal', 'Sabote as missões sem ser descoberto.', 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_role', 'Assassino', 
      NULL, 'Mal', 'Escolhe a Arma e a Evidência. Tenta confundir o grupo.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_role', 'Cúmplice', 
      NULL, 'Mal', 'Sabe quem é o Assassino e ajuda a desviar o foco.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_role', 'Investigador', 
      NULL, 'Bem', 'Tenta descobrir a combinação de Arma e Evidência.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_role', 'Médico Legista', 
      NULL, 'Bem', 'Conhece o segredo e dá pistas sem falar.', 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_role', 'Perito', 
      NULL, 'Bem', 'Testemunha que sabe quem são Assassino e Cúmplice (mas não quem é quem).', 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Faca', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Pistola', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Veneno', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Corda', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Martelo', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Tesoura', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Seringa', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Chave Inglesa', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Estátua', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_weapon', 'Veneno em Cápsula', 
      NULL, NULL, NULL, 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Venenoso', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Silencioso', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Rápido', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Planejado', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Brutal', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Discreto', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Improvisado', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Acidente', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Premeditado', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_clue', 'Furtivo', 
      NULL, NULL, NULL, 
      NULL, NULL
    );

INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Bilhete', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Foto', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Celular', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Chave', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Aliança', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Óculos', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Carteira', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Relógio', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Batom', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Cigarro', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Café', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Carta', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Mapa', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Passaporte', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Remédio', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Luva', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Caderno', 
      NULL, NULL, NULL, 
      NULL, NULL
    );
INSERT INTO game_content (
      game_id, content_type, main_text, secondary_text, category, description, color, impostor_text
    ) VALUES (
      'deception', 'deception_evidence', 'Isqueiro', 
      NULL, NULL, NULL, 
      NULL, NULL
    );

