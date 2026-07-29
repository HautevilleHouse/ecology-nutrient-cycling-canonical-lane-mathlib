import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure PlantUptakeFlux where
  uptakeRate : ℝ
  rootBiomass : ℝ
  nutrientAvailability : ℝ

structure PlantUptakeFluxEvidence (P : PlantUptakeFlux) where
  uptakeRateClosed : P.uptakeRate > 0
  rootBiomassClosed : P.rootBiomass > 0
  nutrientAvailabilityClosed : P.nutrientAvailability > 0

def PlantUptakeFluxClosed (P : PlantUptakeFlux) : Prop :=
  P.uptakeRate > 0 ∧ P.rootBiomass > 0 ∧ P.nutrientAvailability > 0

theorem plant_uptake_flux_closed_from_evidence (P : PlantUptakeFlux) (E : PlantUptakeFluxEvidence P) :
    PlantUptakeFluxClosed P := by
  exact And.intro E.uptakeRateClosed (And.intro E.rootBiomassClosed E.nutrientAvailabilityClosed)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse