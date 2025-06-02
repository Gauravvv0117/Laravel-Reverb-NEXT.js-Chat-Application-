'use client';

import { useState, useEffect } from 'react';
import axios from 'axios';
import { useRouter } from 'next/router';
import Link from 'next/link';
import { Cookie } from 'lucide-react';
import { isAuthenticated } from '../utils/auth'; // Adjust path
import 'bootstrap/dist/css/bootstrap.min.css';

export default function Login() {
  const router = useRouter();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [isAuth, setIsAuth] = useState(false);

  useEffect(() => {
    setIsAuth(isAuthenticated());
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      const res = await axios.post(
        'http://localhost:8000/api/login',
        { email, password },
        { headers: { 'Content-Type': 'application/json' } }
      );
      
      localStorage.setItem('token', res.data.token);
      router.push('/dashboard');
    } catch (err) {
      console.error('Login error:', err.response || err.message || err);
      const message = err?.response?.data?.message || 'Invalid credentials';
      setError(message);
    } finally {
      setLoading(false);
    }
  };

  if (isAuth) {
    return (
      <div className="min-vh-100 d-flex align-items-center justify-content-center text-white" style={styles.bg}>
        <div className="card p-4 rounded-4 shadow-lg text-center" style={{ width: '100%', maxWidth: 400, zIndex: 10, backgroundColor: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)' }}>
          <h3 className="mb-3">Access Denied</h3>
          <p>You are already logged in. The login page is disabled.</p>
          <a href="/dashboard" className="btn btn-primary rounded-pill px-4">
            Go to Dashboard
          </a>
        </div>
      </div>
    );
  }

  return (
    <div className="min-vh-100 d-flex align-items-center justify-content-center text-white" style={styles.bg}>
      <div className="position-absolute w-100 h-100" style={{ zIndex: 0 }}>
        <div style={{ ...styles.blob, ...styles.blob1 }}></div>
        <div style={{ ...styles.blob, ...styles.blob2 }}></div>
      </div>

      <div className="card p-4 rounded-4 shadow-lg" style={{ width: '100%', maxWidth: 400, zIndex: 10, backgroundColor: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)' }}>
        <h3 className="mb-3 text-center">Login</h3>

        {error && <div className="alert alert-danger py-2">{error}</div>}

        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <input
              type="email"
              className="form-control bg-dark border-0 text-white"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>

          <div className="mb-3">
            <input
              type="password"
              className="form-control bg-dark border-0 text-white"
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>

          <button type="submit" className="btn btn-primary w-100" disabled={loading}>
            {loading ? 'Logging in...' : 'Login'}
          </button>
        </form>

        <p className="text-center mt-3">
          Don't have an account?{' '}
          <Link href="/register" className="text-info text-decoration-underline">
            Register
          </Link>
        </p>
      </div>
    </div>
  );
}

// In-file CSS
const styles = {
  input: {
    background: 'rgba(255, 255, 255, 0.05)',
    border: '1px solid rgba(255, 255, 255, 0.2)',
    color: '#fff',
    backdropFilter: 'blur(10px)',
    borderRadius: '50px',
    padding: '0.75rem 1.25rem',
    fontSize: '1rem',
    transition: 'all 0.3s ease',
    outline: 'none',
    boxShadow: 'inset 0 0 0 999px transparent',
  },
  bg: {
    background: 'linear-gradient(135deg, #5b21b6, #1e3a8a, #4f46e5)',
    position: 'relative',
    overflow: 'hidden'
  },
  blob: {
    position: 'absolute',
    borderRadius: '50%',
    filter: 'blur(80px)',
    opacity: 0.2,
    animation: 'pulse 6s infinite'
  },
  blob1: {
    top: '80px',
    left: '50px',
    width: '300px',
    height: '300px',
    backgroundColor: '#a855f7'
  },
  blob2: {
    bottom: '-100px',
    right: '60px',
    width: '300px',
    height: '300px',
    backgroundColor: '#06b6d4'
  }
};