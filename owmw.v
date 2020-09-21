module owmw

const (
    base_url = 'https://api.openweathermap.org/data/2.5/'
)

pub fn start(token string, m int) Weather {
    mut metric := 'imperial'
    if m == 1 {
        metric = 'metric'
    }

    return Weather {
        metric: metric
        token: token
    }
}