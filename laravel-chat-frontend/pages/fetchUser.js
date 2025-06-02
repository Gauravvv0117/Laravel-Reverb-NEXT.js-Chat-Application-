import React, { useEffect, useState } from 'react';
import api from '../utils/api'; // your axios instance

export default function FetchUser() {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchUser() {
      try {
        const response = await api.get('/user');
        setUser(response.data);
      } catch (err) {
        setError('Failed to fetch user');
      } finally {
        setLoading(false);
      }
    }
    fetchUser();
  }, []);

  if (loading) return <p>Loading...</p>;
  if (error) return <p style={{ color: 'red' }}>{error}</p>;

  return (
    <div>
      <h1>User Info</h1>
      <pre>{JSON.stringify(user, null, 2)}</pre>
    </div>
  );
}
