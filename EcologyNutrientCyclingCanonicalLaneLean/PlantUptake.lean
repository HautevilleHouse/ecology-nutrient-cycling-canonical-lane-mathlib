import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure PlantUptakePackage where
  nutrientDemand : Prop
  rootCompetition : Prop
  mycorrhizalAssistance : Prop
  uptakeKinetics : Prop

structure PlantUptakeEvidence (P : PlantUptakePackage) where
  nutrientDemandClosed : P.nutrientDemand
  rootCompetitionClosed : P.rootCompetition
  mycorrhizalAssistanceClosed : P.mycorrhizalAssistance
  uptakeKineticsClosed : P.uptakeKinetics

def PlantUptakeClosed (P : PlantUptakePackage) : Prop :=
  P.nutrientDemand ∧ P.rootCompetition ∧ P.mycorrhizalAssistance ∧ P.uptakeKinetics

theorem plant_uptake_closed_from_evidence (P : PlantUptakePackage) (E : PlantUptakeEvidence P) :
    PlantUptakeClosed P := by
  exact And.intro E.nutrientDemandClosed
    (And.intro E.rootCompetitionClosed
      (And.intro E.mycorrhizalAssistanceClosed E.uptakeKineticsClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse