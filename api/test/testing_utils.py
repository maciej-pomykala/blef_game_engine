from uuid import UUID


def test_games(response):
    """ Test the /games endpoint response"""
    games = response.json()
    assert isinstance(games, list)
    for game in games:
        UUID(game.get("uuid"))
        assert isinstance(game.get("players"), list)
        assert all(isinstance(nickname, str) for nickname in game.get("players", []))
        assert isinstance(game.get("started"), bool)
