musician(guy1).
musician(guy2).
musician(guy3).
musician(guy4).

plays(guy1, clarinet).
plays(guy1, drums).
plays(guy2, guitar).
plays(guy2, drums).
plays(guy2, bass).
plays(guy2, saxophone).
plays(guy3, trumpet).
plays(guy3, guitar).
plays(guy3, hockey).
plays(guy4, vocals).

genre(guy1, jazz).
genre(guy2, rock).
genre(guy2, jazz).
genre(guy3, swing).
genre(guy4, rock).

used_in(Instrument, Genre) :- musician(X), plays(X, Instrument), genre(X, Genre).