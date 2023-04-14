export function authHeader(token) {
  if (token) {
    return { "Authorization": `Bearer ${token}` };
  } else {
    return { };
  }
}

export function handleResponse(response) {
  return response.text().then(text => {
    const data = text && JSON.parse(text);
    if (!response.ok) {
      if (response.status === 401) {
        // TODO: Remove tokens
      }

      const error = (data && data.message) || response.statusText;
      return Promise.reject(error);
    }

    return data;
  });
}
