// Goose-Port-Spiegel von: projects/startup-&-business-concepts-old-party-planner/frontend/react.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-old-party-planner/frontend/react.tsx");
}

// ---- Original-Code (projects/startup-&-business-concepts-old-party-planner/frontend/react.tsx), unveraendert, als Inline-Doku ----
// import { useEffect, useState } from 'react';
// import { Button } from '@/components/ui/button';
// import { Input } from '@/components/ui/input';
// import { Card, CardContent } from '@/components/ui/card';
// import axios from 'axios';
//
// export default function PartyPlanner() {
//   const [user, setUser] = useState(null);
//   const [partyName, setPartyName] = useState('');
//   const [partyDate, setPartyDate] = useState('');
//   const [parties, setParties] = useState([]);
//   const [email, setEmail] = useState('');
//   const [password, setPassword] = useState('');
//   const [isLoggedIn, setIsLoggedIn] = useState(false);
//
//   useEffect(() => {
//     if (isLoggedIn) fetchParties();
//   }, [isLoggedIn]);
//
//   const fetchParties = async () => {
//     const res = await axios.get('/api/parties');
//     setParties(res.data);
//   };
//
//   const createParty = async () => {
//     if (!partyName || !partyDate) return;
//     await axios.post('/api/parties', {
//       name: partyName,
//       date: partyDate
//     });
//     setPartyName('');
//     setPartyDate('');
//     fetchParties();
//   };
//
//   const removeParty = async (id) => {
//     await axios.delete(`/api/parties/${id}`);
//     fetchParties();
//   };
//
//   const login = async () => {
//     const res = await axios.post('/api/login', { email, password });
//     if (res.data.success) {
//       setIsLoggedIn(true);
//       setUser({ email });
//     }
//   };
//
//   const logout = () => {
//     setIsLoggedIn(false);
//     setUser(null);
//     setParties([]);
//   };
//
//   return (
//     <div className="p-4 max-w-2xl mx-auto">
//       {isLoggedIn ? (
//         <>
//           <div className="flex justify-between items-center mb-4">
//             <h1 className="text-2xl font-bold">Welcome, {user.email}</h1>
//             <Button onClick={logout}>Logout</Button>
//           </div>
//           <div className="flex gap-2 mb-4">
//             <Input
//               placeholder="Party name"
//               value={partyName}
//               onChange={(e) => setPartyName(e.target.value)}
//             />
//             <Input
//               type="date"
//               value={partyDate}
//               onChange={(e) => setPartyDate(e.target.value)}
//             />
//             <Button onClick={createParty}>Create</Button>
//           </div>
//           <div className="grid gap-4">
//             {parties.map((party) => (
//               <Card key={party.id}>
//                 <CardContent className="flex justify-between items-center">
//                   <div>
//                     <h2 className="text-lg font-semibold">{party.name}</h2>
//                     <p>{party.date}</p>
//                   </div>
//                   <Button onClick={() => removeParty(party.id)} variant="destructive">
//                     Delete
//                   </Button>
//                 </CardContent>
//               </Card>
//             ))}
//           </div>
//         </>
//       ) : (
//         <div className="text-center space-y-4">
//           <h1 className="text-2xl font-bold">Party Planner Login</h1>
//           <Input placeholder="Email" value={email} onChange={(e) => setEmail(e.target.value)} />
//           <Input type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} />
//           <Button onClick={login}>Login</Button>
//         </div>
//       )}
//     </div>
//   );
// }
//
