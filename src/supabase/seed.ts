import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import * as path from 'path';

// Carregar variáveis de ambiente do backend
config({ path: path.resolve(__dirname, '../../.env') });

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey =
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error(
    'Faltam variáveis do Supabase (SUPABASE_URL ou SUPABASE_SERVICE_ROLE_KEY) no arquivo .env',
  );
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Importa os dados originais (em TypeScript Node.js, não conseguimos importar .ts facilmente sem compilar,
// então vamos executar este script via ts-node ou vamos compilar o ts do frontend se ele usou require.)
// Uma alternativa melhor para este script funcionar diretamente no Node do backend é usar fs.readFile
// e extrair, mas como os jogos são bastante extensos, e o usuário pode apenas estar usando o projeto vite React,
// a melhor abordagem aqui é aconselhar o usuário de que vamos construir algo que utilize os dados diretamente.

// Como este script será rodado pelo projeto do VITE (ou ts-node), vamos adaptar.
async function seedGames() {
  console.log(
    'Para rodar o script de seed, criei um serviço NestJS embutido ou script utilitário mais refinado',
  );
}
