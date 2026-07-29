import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure EcosystemNutrientFluxPackage where
  litterfallInput : Prop
  decompositionRate : Prop
  mineralization : Prop
  plantUptake : Prop
  leachingLoss : Prop
  denitrification : Prop
  nitrogenFixation : Prop
  phosphorusWeathering : Prop

structure EcosystemNutrientFluxEvidence (P : EcosystemNutrientFluxPackage) where
  litterfallInputClosed : P.litterfallInput
  decompositionRateClosed : P.decompositionRate
  mineralizationClosed : P.mineralization
  plantUptakeClosed : P.plantUptake
  leachingLossClosed : P.leachingLoss
  denitrificationClosed : P.denitrification
  nitrogenFixationClosed : P.nitrogenFixation
  phosphorusWeatheringClosed : P.phosphorusWeathering

def EcosystemNutrientFluxClosed (P : EcosystemNutrientFluxPackage) : Prop :=
  P.litterfallInput ∧ P.decompositionRate ∧ P.mineralization ∧
  P.plantUptake ∧ P.leachingLoss ∧ P.denitrification ∧
  P.nitrogenFixation ∧ P.phosphorusWeathering

theorem ecosystem_nutrient_flux_closed_from_evidence
    (P : EcosystemNutrientFluxPackage) (E : EcosystemNutrientFluxEvidence P) :
    EcosystemNutrientFluxClosed P := by
  exact And.intro E.litterfallInputClosed
    (And.intro E.decompositionRateClosed
      (And.intro E.mineralizationClosed
        (And.intro E.plantUptakeClosed
          (And.intro E.leachingLossClosed
            (And.intro E.denitrificationClosed
              (And.intro E.nitrogenFixationClosed
                E.phosphorusWeatheringClosed))))))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse
