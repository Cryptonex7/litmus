import { makeStyles } from '@material-ui/core';

const useStyles = makeStyles((theme) => ({
  cardsDiv: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
    flexGrow: 1,
    [theme.breakpoints.down('sm')]: {
      display: 'flex',
      flexDirection: 'column',
      height: '100%',
    },
  },
  statsHeading: {
    fontSize: '1.5625rem',
    marginBottom: theme.spacing(3.75),
    paddingTop: theme.spacing(10),
  },

  quickActionDiv: {
    marginTop: theme.spacing(4),
    marginRight: theme.spacing(-6),
  },

  aggregate: {
    marginLeft: theme.spacing(-1.5),
  },

  btnHeaderDiv: {
    display: 'flex',
    flexDirection: 'row',
  },

  seeAllBtn: {
    width: '7.5rem',
    height: '2.5rem',
    marginTop: theme.spacing(10),
    marginLeft: theme.spacing(4),
    [theme.breakpoints.down('sm')]: {
      marginTop: theme.spacing(10),
      marginBottom: theme.spacing(1),
      marginLeft: theme.spacing(3.8),
    },
  },

  btnSpan: {
    display: 'flex',
    flexDirection: 'row',
  },

  btnText: {
    paddingRight: theme.spacing(1.25),
    textDecoration: 'none',
    textTransform: 'none',
    color: theme.palette.primary.main,
  },

  resilienceScoresDiv: { width: '63%' },

  othersDiv: {
    marginTop: theme.spacing(-5),
    marginBottom: theme.spacing(5),
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
    flexGrow: 1,
    [theme.breakpoints.down('sm')]: {
      display: 'flex',
      flexDirection: 'column',
    },
  },

  extrasDiv: {
    marginRight: theme.spacing(8),
    marginTop: theme.spacing(20),
  },

  fixedRecents: {
    height: '15rem',
    width: '20rem',
    color: theme.palette.text.primary,
    // (Uncomment when recent activities are available.)
    // backgroundColor: theme.palette.secondary.contrastText,
    background: 'rgba(0, 0, 0, 0.4)',
  },

  backgroundFix: {
    color: theme.palette.text.primary,
    backgroundColor: theme.palette.background.paper,
  },

  comingSoon: {
    color: theme.palette.text.secondary,
    marginLeft: theme.spacing(8.25),
    marginTop: theme.spacing(12),
  },

  loader: {
    position: 'fixed',
    top: '50%',
    left: '50%',
  },
}));

export default useStyles;
