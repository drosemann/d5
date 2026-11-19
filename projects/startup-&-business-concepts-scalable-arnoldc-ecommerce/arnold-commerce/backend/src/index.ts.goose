// Goose-Port-Spiegel von: projects/startup-&-business-concepts-scalable-arnoldc-ecommerce/arnold-commerce/backend/src/index.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-scalable-arnoldc-ecommerce/arnold-commerce/backend/src/index.ts");
}

// ---- Original-Code (projects/startup-&-business-concepts-scalable-arnoldc-ecommerce/arnold-commerce/backend/src/index.ts), unveraendert, als Inline-Doku ----
// import express from 'express';
// import cors from 'cors';
// import helmet from 'helmet';
// import morgan from 'morgan';
// import { config } from 'dotenv';
// import { errorHandler } from './middleware/errorHandler';
// import { notFoundHandler } from './middleware/notFoundHandler';
// import { router as productRoutes } from './routes/product.routes';
// import { router as cartRoutes } from './routes/cart.routes';
// import { router as authRoutes } from './routes/auth.routes';
// import { router as userRoutes } from './routes/user.routes';
//
// // Load environment variables
// config();
//
// const app = express();
// const PORT = process.env.PORT || 5000;
//
// // Middleware
// app.use(helmet());
// app.use(cors());
// app.use(express.json());
// app.use(morgan('dev'));
//
// // API Routes
// app.use('/api/products', productRoutes);
// app.use('/api/cart', cartRoutes);
// app.use('/api/auth', authRoutes);
// app.use('/api/users', userRoutes);
//
// // Health check endpoint
// app.get('/health', (req, res) => {
//   res.status(200).json({ status: 'ok', timestamp: new Date().toISOString() });
// });
//
// // 404 handler
// app.use(notFoundHandler);
//
// // Error handler
// app.use(errorHandler);
//
// // Start server
// app.listen(PORT, () => {
//   console.log(`🚀 Server is running on http://localhost:${PORT}`);
// });
//
// export { app };
//
