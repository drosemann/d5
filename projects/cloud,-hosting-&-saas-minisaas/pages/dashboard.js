export default function Dashboard({ user }) {
  return (
    <div style={{ padding: '2rem', fontFamily: 'sans-serif' }}>
      <h1>Dashboard</h1>
      <p>Welcome, {user}!</p>
      <form method="post" action="/api/ollama">
        <textarea name="prompt" placeholder="Enter your AI prompt" rows="4" cols="50" />
        <br />
        <button type="submit">Call Ollama</button>
      </form>
    </div>
  );
}

export async function getServerSideProps({ req, res }) {
  const { cookie } = req.headers;
  let user = null;
  if (cookie) {
    const match = cookie.match(/user=([^;]+)/);
    if (match) {
      user = decodeURIComponent(match[1]);
    }
  }
  if (!user) {
    return {
      redirect: { destination: '/', permanent: false }
    };
  }
  return {
    props: { user }
  };
}
