export interface IFilm {
  description?: string;
  filmId: number;
  length?: number;
  rating?: string;
  releaseYear?: number;
  rentalDuration: number;
  rentalRate: number;
  replacementCost: number;
  title: string;

  languageDescriptiveField?: number;
  languageId: number;
}
