UPDATE questions
SET translations = '{"en": "Worst way to die.", "da": "V\u00e6rste m\u00e5de at d\u00f8 p\u00e5.", "de": "Schlimmste Art zu sterben.", "es": "La peor forma de morir.", "pt": "Pior maneira de morrer.", "ro": "Cel mai groaznic mod de a muri.", "fr": "La pire fa\u00e7on de mourir.", "it": "Peggior modo di morire.", "fi": "Pahin tapa kuolla.", "nl": "Ergste manier om te sterven.", "no": "Verste m\u00e5te \u00e5 d\u00f8 p\u00e5.", "sv": "V\u00e4rsta s\u00e4ttet att d\u00f6.", "pl": "Najgorszy spos\u00f3b na \u015bmier\u0107."}'::jsonb,
    updated_at = NOW()
WHERE category_name = 'After Dark Talks'
  AND translations->>'en' = 'Worst way to die.';
UPDATE questions
SET translations = '{"en": "Would cannibalism ever be an option?", "da": "Ville kannibalisme nogensinde v\u00e6re en mulighed?", "de": "W\u00e4re Kannibalismus jemals eine Option?", "es": "\u00bfSer\u00eda el canibalismo alguna vez una opci\u00f3n?", "pt": "O canibalismo seria alguma vez uma op\u00e7\u00e3o?", "ro": "Ar fi vreodat\u0103 canibalismul o op\u021biune?", "fr": "Le cannibalisme serait-il jamais une option ?", "it": "Il cannibalismo sarebbe mai un\u2019opzione?", "fi": "Voisiko kannibalismi ikin\u00e4 olla vaihtoehto?", "nl": "Zou kannibalisme ooit een optie zijn?", "no": "Kunne kannibalisme noen gang v\u00e6rt et alternativ?", "sv": "Skulle kannibalism n\u00e5gonsin kunna vara ett alternativ?", "pl": "Czy kanibalizm m\u00f3g\u0142by kiedykolwiek by\u0107 opcj\u0105?"}'::jsonb,
    updated_at = NOW()
WHERE category_name = 'After Dark Talks'
  AND translations->>'en' = 'Would cannibalism ever be an option?';
UPDATE questions
SET translations = '{"en": "\u201cGlitch in the Matrix\u201d moment\u2014got one?", "da": "Har du nogensinde haft et \u201cGlitch in the Matrix\u201d-\u00f8jeblik?", "de": "Hattest du jemals einen \u201eGlitch in der Matrix\u201c-Moment?", "es": "\u00bfHas tenido alguna vez un momento de \u201cfallo en la Matrix\u201d?", "pt": "J\u00e1 tiveste algum momento de \u201cfalha na Matrix\u201d?", "ro": "Moment de tip \u201edefec\u021biune \u00een Matrix\u201d \u2013 ai avut vreunul?", "fr": "As-tu d\u00e9j\u00e0 v\u00e9cu un moment de \u00ab bug dans la Matrice \u00bb ?", "it": "Momento \"glitch nella Matrix\": ne hai uno?", "fi": "\"Glitch in the Matrix\" -hetki \u2013 onko sinulla sellaista?", "nl": "\"Glitch in the Matrix\"-moment \u2013 heb jij er \u00e9\u00e9n?", "no": "\"Glitch in the Matrix\"-\u00f8yeblikk \u2013 har du ett?", "sv": "\"Glitch in the Matrix\"-\u00f6gonblick \u2013 har du n\u00e5got?", "pl": "Moment \"glitch in the Matrix\" \u2013 masz taki?"}'::jsonb,
    updated_at = NOW()
WHERE category_name = 'After Dark Talks'
  AND translations->>'en' = '“Glitch in the Matrix” moment—got one?';
UPDATE questions
SET translations = '{"en": "Would you rather meet a man or a bear in the forest?", "da": "Ville du hellere m\u00f8de en mand eller en bj\u00f8rn i skoven?", "de": "W\u00fcrdest du lieber einem Mann oder einem B\u00e4ren im Wald begegnen?", "es": "\u00bfPreferir\u00edas encontrarte con un hombre o con un oso en el bosque?", "pt": "Preferias encontrar um homem ou um urso na floresta?", "ro": "Ai prefera s\u0103 \u00eent\u00e2lne\u0219ti un b\u0103rbat sau un urs \u00een p\u0103dure?", "fr": "Pr\u00e9f\u00e8rerais-tu croiser un homme ou un ours dans la for\u00eat ?", "it": "Preferiresti incontrare un uomo o un orso nel bosco?", "fi": "Haluaisitko mieluummin kohdata mets\u00e4ss\u00e4 miehen vai karhun?", "nl": "Kom je liever een man of een beer tegen in het bos?", "no": "Vil du helst m\u00f8te en mann eller en bj\u00f8rn i skogen?", "sv": "Skulle du hellre m\u00f6ta en man eller en bj\u00f6rn i skogen?", "pl": "Wolisz spotka\u0107 w lesie m\u0119\u017cczyzn\u0119 czy nied\u017awiedzia?"}'::jsonb,
    updated_at = NOW()
WHERE category_name = 'After Dark Talks'
  AND translations->>'en' = 'Would you rather meet a man or a bear in the forest?';
