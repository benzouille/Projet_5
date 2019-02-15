
CREATE SEQUENCE public.statut_statut_id_seq;

CREATE TABLE public.Statut (
                statut_id INTEGER NOT NULL DEFAULT nextval('public.statut_statut_id_seq'),
                status VARCHAR NOT NULL,
                CONSTRAINT statut_pk PRIMARY KEY (statut_id)
);


ALTER SEQUENCE public.statut_statut_id_seq OWNED BY public.Statut.statut_id;

CREATE SEQUENCE public.stock_id_seq_2;

CREATE TABLE public.Stock (
                stock_id INTEGER NOT NULL DEFAULT nextval('public.stock_id_seq_2'),
                nom VARCHAR(100) NOT NULL,
                quantite INTEGER NOT NULL,
                unite VARCHAR(100) NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (stock_id)
);


ALTER SEQUENCE public.stock_id_seq_2 OWNED BY public.Stock.stock_id;

CREATE SEQUENCE public.recette_id_seq_1;

CREATE TABLE public.Recette (
                recette_id INTEGER NOT NULL DEFAULT nextval('public.recette_id_seq_1'),
                nom VARCHAR(100) NOT NULL,
                recette VARCHAR(1000) NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (recette_id)
);


ALTER SEQUENCE public.recette_id_seq_1 OWNED BY public.Recette.recette_id;

CREATE SEQUENCE public.employe_id_seq;

CREATE TABLE public.Employe (
                employe_id INTEGER NOT NULL DEFAULT nextval('public.employe_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                adresse_mail VARCHAR(100) NOT NULL,
                num_tel NUMERIC NOT NULL,
                mot_de_passe VARCHAR(100) NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (employe_id)
);


ALTER SEQUENCE public.employe_id_seq OWNED BY public.Employe.employe_id;

CREATE SEQUENCE public.role_role_id_seq;

CREATE TABLE public.Role (
                role_id INTEGER NOT NULL DEFAULT nextval('public.role_role_id_seq'),
                nom VARCHAR(50) NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (role_id)
);


ALTER SEQUENCE public.role_role_id_seq OWNED BY public.Role.role_id;

CREATE SEQUENCE public.roleemploye_roleemploye_id_seq;

CREATE TABLE public.RoleEmploye (
                roleEmploye_id VARCHAR NOT NULL DEFAULT nextval('public.roleemploye_roleemploye_id_seq'),
                role_id INTEGER NOT NULL,
                employe_id INTEGER NOT NULL,
                CONSTRAINT roleemploye_pk PRIMARY KEY (roleEmploye_id)
);


ALTER SEQUENCE public.roleemploye_roleemploye_id_seq OWNED BY public.RoleEmploye.roleEmploye_id;

CREATE SEQUENCE public.categorie_id_seq_1;

CREATE TABLE public.Categorie (
                categorie_id INTEGER NOT NULL DEFAULT nextval('public.categorie_id_seq_1'),
                Parent_id INTEGER,
                nom VARCHAR(100) NOT NULL,
                CONSTRAINT categorie_pk PRIMARY KEY (categorie_id)
);


ALTER SEQUENCE public.categorie_id_seq_1 OWNED BY public.Categorie.categorie_id;

CREATE SEQUENCE public.ingredient_reference_seq;

CREATE TABLE public.Ingredient (
                ingredient_reference VARCHAR NOT NULL DEFAULT nextval('public.ingredient_reference_seq'),
                stock_id INTEGER NOT NULL,
                nom VARCHAR NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_reference)
);


ALTER SEQUENCE public.ingredient_reference_seq OWNED BY public.Ingredient.ingredient_reference;

CREATE SEQUENCE public.composition_composition_id_seq;

CREATE TABLE public.composition (
                composition_id INTEGER NOT NULL DEFAULT nextval('public.composition_composition_id_seq'),
                recette_id INTEGER NOT NULL,
                ingredient_reference VARCHAR NOT NULL,
                CONSTRAINT composition_pk PRIMARY KEY (composition_id)
);


ALTER SEQUENCE public.composition_composition_id_seq OWNED BY public.composition.composition_id;

CREATE SEQUENCE public.article_reference_seq;

CREATE TABLE public.Article (
                article_reference VARCHAR NOT NULL DEFAULT nextval('public.article_reference_seq'),
                nom VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                prix_ht NUMERIC(10,2) NOT NULL,
                tva_100 NUMERIC(6,4) NOT NULL,
                categorie_id INTEGER NOT NULL,
                stock_id INTEGER,
                recette_id INTEGER,
                CONSTRAINT article_pk PRIMARY KEY (article_reference)
);


ALTER SEQUENCE public.article_reference_seq OWNED BY public.Article.article_reference;

CREATE SEQUENCE public.client_id_seq;

CREATE TABLE public.Client (
                client_id INTEGER NOT NULL DEFAULT nextval('public.client_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                adresse_mail VARCHAR(100) NOT NULL,
                num_tel NUMERIC NOT NULL,
                mot_de_passe VARCHAR(100) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (client_id)
);


ALTER SEQUENCE public.client_id_seq OWNED BY public.Client.client_id;

CREATE SEQUENCE public.adresse_id_seq_1;

CREATE TABLE public.Adresse (
                adresse_id INTEGER NOT NULL DEFAULT nextval('public.adresse_id_seq_1'),
                client_id INTEGER NOT NULL,
                destinataire VARCHAR(100) NOT NULL,
                complement_destinataire VARCHAR(100),
                voie VARCHAR(100) NOT NULL,
                complement_voie VARCHAR(100),
                complement_etage VARCHAR(100),
                code_postal NUMERIC(5) NOT NULL,
                localite VARCHAR(100) NOT NULL,
                adresse_facturation BOOLEAN NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (adresse_id)
);


ALTER SEQUENCE public.adresse_id_seq_1 OWNED BY public.Adresse.adresse_id;

CREATE SEQUENCE public.commande_reference_seq;

CREATE TABLE public.Commande (
                commande_reference INTEGER NOT NULL DEFAULT nextval('public.commande_reference_seq'),
                client_id INTEGER NOT NULL,
                roleEmploye_id VARCHAR,
                date TIMESTAMP NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (commande_reference)
);


ALTER SEQUENCE public.commande_reference_seq OWNED BY public.Commande.commande_reference;

CREATE SEQUENCE public.statutcommande_statutcommande_id_seq;

CREATE TABLE public.StatutCommande (
                statutcommande_id INTEGER NOT NULL DEFAULT nextval('public.statutcommande_statutcommande_id_seq'),
                commande_reference INTEGER NOT NULL,
                statut_id INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                CONSTRAINT statutcommande_pk PRIMARY KEY (statutcommande_id)
);


ALTER SEQUENCE public.statutcommande_statutcommande_id_seq OWNED BY public.StatutCommande.statutcommande_id;

CREATE SEQUENCE public.lignecommande_lignecommande_id_seq;

CREATE TABLE public.LigneCommande (
                ligneCommande_id INTEGER NOT NULL DEFAULT nextval('public.lignecommande_lignecommande_id_seq'),
                commande_reference INTEGER NOT NULL,
                article_reference VARCHAR NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT lignecommande_pk PRIMARY KEY (ligneCommande_id)
);


ALTER SEQUENCE public.lignecommande_lignecommande_id_seq OWNED BY public.LigneCommande.ligneCommande_id;

CREATE SEQUENCE public.livraison_id_seq_1;

CREATE TABLE public.Livraison (
                livraison_id INTEGER NOT NULL DEFAULT nextval('public.livraison_id_seq_1'),
                commande_reference INTEGER NOT NULL,
                adresse_id INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                CONSTRAINT livraison_pk PRIMARY KEY (livraison_id)
);


ALTER SEQUENCE public.livraison_id_seq_1 OWNED BY public.Livraison.livraison_id;

CREATE SEQUENCE public.facture_reference_seq;

CREATE TABLE public.Facture (
                facture_reference VARCHAR NOT NULL DEFAULT nextval('public.facture_reference_seq'),
                livraison_id INTEGER NOT NULL,
                date DATE NOT NULL,
                total_ht NUMERIC(10,2) NOT NULL,
                total_tva NUMERIC(10,2) NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (facture_reference)
);


ALTER SEQUENCE public.facture_reference_seq OWNED BY public.Facture.facture_reference;

ALTER TABLE public.StatutCommande ADD CONSTRAINT statut_statutcommande_fk
FOREIGN KEY (statut_id)
REFERENCES public.Statut (statut_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ingredient ADD CONSTRAINT stock_ingredient_fk
FOREIGN KEY (stock_id)
REFERENCES public.Stock (stock_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Article ADD CONSTRAINT stock_article_fk
FOREIGN KEY (stock_id)
REFERENCES public.Stock (stock_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Article ADD CONSTRAINT recette_article_fk
FOREIGN KEY (recette_id)
REFERENCES public.Recette (recette_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.composition ADD CONSTRAINT recette_composition_fk
FOREIGN KEY (recette_id)
REFERENCES public.Recette (recette_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.RoleEmploye ADD CONSTRAINT employe_role_employe_fk
FOREIGN KEY (employe_id)
REFERENCES public.Employe (employe_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.RoleEmploye ADD CONSTRAINT role_role_employe_fk
FOREIGN KEY (role_id)
REFERENCES public.Role (role_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT roleemploye_commande_fk
FOREIGN KEY (roleEmploye_id)
REFERENCES public.RoleEmploye (roleEmploye_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Article ADD CONSTRAINT categorie_article_fk
FOREIGN KEY (categorie_id)
REFERENCES public.Categorie (categorie_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Categorie ADD CONSTRAINT categorie_categorie_fk
FOREIGN KEY (Parent_id)
REFERENCES public.Categorie (categorie_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.composition ADD CONSTRAINT ingredient_composition_fk
FOREIGN KEY (ingredient_reference)
REFERENCES public.Ingredient (ingredient_reference)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.LigneCommande ADD CONSTRAINT article_lignecommande_fk
FOREIGN KEY (article_reference)
REFERENCES public.Article (article_reference)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT utilisateur_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.Client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (client_id)
REFERENCES public.Client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison ADD CONSTRAINT adresse_livraison_fk
FOREIGN KEY (adresse_id)
REFERENCES public.Adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison ADD CONSTRAINT commande_livraison_fk
FOREIGN KEY (commande_reference)
REFERENCES public.Commande (commande_reference)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.LigneCommande ADD CONSTRAINT commande_lignecommande_fk
FOREIGN KEY (commande_reference)
REFERENCES public.Commande (commande_reference)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.StatutCommande ADD CONSTRAINT commande_statutcommande_fk
FOREIGN KEY (commande_reference)
REFERENCES public.Commande (commande_reference)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Facture ADD CONSTRAINT livraison_facture_fk
FOREIGN KEY (livraison_id)
REFERENCES public.Livraison (livraison_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
