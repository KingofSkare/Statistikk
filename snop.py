import numpy as np

# Funksjon for å lage frekvenstabell og kumulativ frekvenstabell
def create_frequency_tables(df, bins):
    # Frekvenstabell
    freq_table = pd.cut(df['Økning'], bins=bins).value_counts().sort_index()

    # Kumulativ frekvenstabell
    cum_freq_table = freq_table.cumsum()

    return freq_table, cum_freq_table

# Definere bins for frekvenstabellene
bins = np.arange(0, df['Økning'].max() + 1, 1)

# Lage frekvenstabeller og kumulative frekvenstabeller for hver fargekombinasjon
rosa_kvit_freq, rosa_kvit_cum_freq = create_frequency_tables(rosa_kvit_cleaned, bins)
rosa_blå_freq, rosa_blå_cum_freq = create_frequency_tables(rosa_blå_cleaned, bins)
rosa_grønn_freq, rosa_grønn_cum_freq = create_frequency_tables(rosa_grønn_cleaned, bins)

rosa_kvit_freq.head(), rosa_kvit_cum_freq.head(), rosa_blå_freq.head(), rosa_blå_cum_freq.head(), rosa_grønn_freq.head(), rosa_grønn_cum_freq.head()

