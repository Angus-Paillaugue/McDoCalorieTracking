import pool from './pool.ts';

async function main(argv: typeof process.argv) {
  if (argv.length !== 3) {
    const cli = argv[0].split('/').pop() || 'cli';
    console.error(`Usage: ${cli} run cd:make-op <username>`);
    process.exit(1);
  }

  const username = argv[2];
  if (!username) {
    console.error('Username is required.');
    process.exit(1);
  }

  const userExistsResult = await pool.query('SELECT 1 FROM users WHERE username = $1', [username]);
  const userExists = userExistsResult.rows.length > 0;
  if (!userExists) {
    console.error(`User with username "${username}" does not exist.`);
    process.exit(1);
  }

  await pool.query('UPDATE users SET isAdmin = true WHERE username = $1', [username]);

  console.log(`User "${username}" has been granted admin privileges.`);
  process.exit(0);
}

main(process.argv);
