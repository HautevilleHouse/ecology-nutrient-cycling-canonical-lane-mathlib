import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure UptakeCompetitionPackage where
  plantAffinity : ℝ
  microbialAffinity : ℝ
  rootUptakeRate : ℝ
  microbialUptakeRate : ℝ
  uptakeNonnegativity : Prop
  competitionResolution : Prop
  nichePartitioning : Prop

structure UptakeCompetitionEvidence (U : UptakeCompetitionPackage) where
  uptakeNonnegativityClosed : U.uptakeNonnegativity
  competitionResolutionClosed : U.competitionResolution
  nichePartitioningClosed : U.nichePartitioning

def UptakeCompetitionClosed (U : UptakeCompetitionPackage) : Prop :=
  U.uptakeNonnegativity ∧ U.competitionResolution ∧ U.nichePartitioning

theorem uptake_competition_closed_from_evidence (U : UptakeCompetitionPackage) (E : UptakeCompetitionEvidence U) : UptakeCompetitionClosed U := by
  exact And.intro E.uptakeNonnegativityClosed (And.intro E.competitionResolutionClosed E.nichePartitioningClosed)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse