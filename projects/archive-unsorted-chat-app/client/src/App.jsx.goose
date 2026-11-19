// Goose-Port-Spiegel von: projects/archive-unsorted-chat-app/client/src/App.jsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-chat-app/client/src/App.jsx");
}

// ---- Original-Code (projects/archive-unsorted-chat-app/client/src/App.jsx), unveraendert, als Inline-Doku ----
// import React from 'react';
// import { Routes, Route, Navigate } from 'react-router-dom';
// import Login from './pages/Login';
// import Register from './pages/Register';
// import Chat from './pages/Chat';
// import PrivateRoute from './components/PrivateRoute';
// import { useAuthStore } from './stores/authStore';
// import { Box } from '@mui/material';
//
// function App() {
//   const isAuthenticated = useAuthStore((state) => state.isAuthenticated);
//
//   return (
//     <Box sx={{ height: '100vh', display: 'flex' }}>
//       <Routes>
//         <Route path="/login" element={<Login />} />
//         <Route path="/register" element={<Register />} />
//         <Route
//           path="/"
//           element={
//             <PrivateRoute>
//               <Chat />
//             </PrivateRoute>
//           }
//         />
//         <Route path="*" element={<Navigate to="/" />} />
//       </Routes>
//     </Box>
//   );
// }
//
// export default App;
//
